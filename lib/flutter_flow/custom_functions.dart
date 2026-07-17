import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double totalSub(
  List<double> subtotal,
  List<int> cantidad,
) {
  double total = 0;
  for (int i = 0; i < subtotal.length; i++) {
    total += subtotal[i] * cantidad[i];
  }
  return total + (total * 0.13);
}

double totalDescSub(
  List<double> subtotal,
  double descuento,
  List<int> cantidad,
) {
  double total = 0;
  for (int i = 0; i < subtotal.length; i++) {
    total += subtotal[i] * cantidad[i];
  }
  return (total + (total * 0.13)) - descuento;
}

double sumarSub(
  double valorSub,
  double precio,
) {
  valorSub = valorSub + precio;
  return valorSub;
}

double restarSub(
  double valorSub,
  double precio,
) {
  if (valorSub > 0) {
    valorSub = valorSub - precio;
  }
  return valorSub;
}

double getSubtotal(
  List<double> subtotal,
  List<int> cantidad,
) {
  double total = 0;
  //double temp = 0;
  for (int i = 0; i < subtotal.length; i++) {
    total = (subtotal[i] * cantidad[i]) + total;
    //total += temp;
  }
  return total;
}

double agregarImpuesto(
  List<double> subtotal,
  List<int> cantidad,
) {
  double imp = 0;
  for (int i = 0; i < subtotal.length; i++) {
    imp += subtotal[i] * cantidad[i];
  }
  imp = imp * 0.13;
  return imp;
}

DateTime? startOfDay(DateTime? date) {
  if (date == null) return null;
  return DateTime(date.year, date.month, date.day);
}

DateTime? endOfDay(DateTime? date) {
  if (date == null) return null; // seguridad si no hay fecha seleccionada
  return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
}

double calculateTotalCierre(List<VentaRecord> ventasList) {
  double total = 0.0;

  for (final venta in ventasList) {
    // Usa la propiedad generada por FlutterFlow (camelCase)
    final totalVenta = venta.ventTotal;
    if (totalVenta != null) {
      total += totalVenta ?? 0;
    }
  }

  return total;
}

double getSubFromTotal(double total) {
  return total / (1 + 0.13);
}

double getTaxFromTotal(double total) {
  return total * 0.13;
}

double sumTotal(List<double> totals) {
  double sum = 0;
  for (var t in totals) {
    sum += t;
  }
  return sum;
}

double newCustomFunction(
  String nombre,
  String nombre2,
  List<double> valores,
) {
  // quiero que si el nombre y el nombre2 son iguales, que vaya a la coleccion y sume todos los valores encontrados con ese nombre, asi generando un valor total relacionado solo a ese nombre
  if (nombre == nombre2) {
    return valores.fold(0.0, (sum, value) => sum + value);
  }
  return 0.0;
}

double? getLat(LatLng? myLocation) {
  return myLocation!.latitude;
}

double? getLng(LatLng? myLocation) {
  return myLocation!.longitude;
}

String? getShortAddress(dynamic jsonResult) {
  if (jsonResult == null ||
      jsonResult['results'] == null ||
      jsonResult['results'].isEmpty) {
    return "Ubicación desconocida";
  }

  // Obtenemos los componentes de la dirección
  // Usamos 'as List' para asegurar que Dart sepa que es una lista
  List components = jsonResult['results'][0]['address_components'] as List;

  String? ciudad;
  String? barrio;

  for (var c in components) {
    // Verificamos tipos de forma segura
    List types = c['types'] as List;

    // Buscar la localidad (Ciudad)
    if (types.contains('locality')) {
      ciudad = c['long_name'];
    }
    // Buscar sublocalidad o vecindario (Barrio)
    if (types.contains('sublocality') ||
        types.contains('neighborhood') ||
        types.contains('administrative_area_level_2')) {
      barrio ??= c['long_name'];
    }
  }

  // Armar el texto final
  if (barrio != null && ciudad != null) {
    return "$barrio, $ciudad";
  } else if (ciudad != null) {
    return ciudad;
  } else {
    // Si falla el filtro, devuelve la dirección formateada corta
    // Agregamos chequeos de seguridad extra para el split
    String fullAddress = jsonResult['results'][0]['formatted_address'];
    List<String> parts = fullAddress.split(',');
    if (parts.length > 1) {
      return parts[1].trim();
    } else {
      return fullAddress;
    }
  }
}

int actualizarCantInv(
  int actual,
  int cantidad,
) {
  return actual - cantidad;
}
