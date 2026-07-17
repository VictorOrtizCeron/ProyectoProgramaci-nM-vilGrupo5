const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
exports.adminCreateUser = functions.https.onCall(async (data, context) => {
  // Verificar que el usuario que llama sea admin
  if (!context.auth || context.auth.token.role !== "admin") {
    throw new functions.https.HttpsError(
      "permission-denied",
      "Solo un admin puede crear usuarios.",
    );
  }

  const { email, password, nombre, rol } = data;

  // Crear usuario en Authentication
  const userRecord = await admin.auth().createUser({
    email,
    password,
  });

  // Crear documento en Firestore
  await admin.firestore().collection("USUARIOS").doc(userRecord.uid).set({
    email,
    nombre,
    rol,
    creadoPor: context.auth.uid,
    fechaCreacion: admin.firestore.FieldValue.serverTimestamp(),
  });

  return { success: true, uid: userRecord.uid };
});
