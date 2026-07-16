# Guía de compilación, firma y ejecución (macOS 13 Ventura)

Esta guía cubre cómo compilar, firmar, notarizar y ejecutar **MoveMouse** en
macOS 13 Ventura (también válido para Monterey 12 y versiones posteriores).

## Requisitos

- macOS 13 Ventura o superior.
- **Xcode 14 o superior** (con las Command Line Tools instaladas:
  `xcode-select --install`).
- Para *distribuir* (firmar/notarizar): una cuenta de **Apple Developer** y un
  certificado *Developer ID Application* en tu llavero.

> El deployment target del proyecto es macOS 12.0, así que el binario resultante
> funciona en Ventura (13) y en Monterey (12).

---

## 1. Compilar y ejecutar desde Xcode (lo más simple)

1. Abre `MoveMouse.xcodeproj` en Xcode.
2. Selecciona el esquema **MoveMouse** y como destino **My Mac**.
3. Pulsa **Run** (⌘R).
4. La primera vez que pulses **"Move mouse"**, macOS mostrará el aviso de
   Accesibilidad (ver sección 3).

> Nota: cada vez que recompilas en Xcode, macOS considera la app como una build
> nueva y puede pedirte volver a conceder el permiso de Accesibilidad.

---

## 2. Compilar desde la terminal

### Build de desarrollo

```bash
xcodebuild \
  -project MoveMouse.xcodeproj \
  -scheme MoveMouse \
  -configuration Release \
  -derivedDataPath build
```

El `.app` queda en:

```
build/Build/Products/Release/MoveMouse.app
```

Puedes lanzarlo con:

```bash
open build/Build/Products/Release/MoveMouse.app
```

---

## 3. Conceder permiso de Accesibilidad (imprescindible)

MoveMouse mueve el cursor enviando eventos con `CGEvent`, lo que requiere permiso
de **Accesibilidad**. En Ventura:

1. Abre **Ajustes del Sistema → Privacidad y seguridad → Accesibilidad**.
2. Activa el interruptor de **MoveMouse** (si no aparece, pulsa "+" y selecciona
   el `.app`).
3. **Relanza la app** — macOS suele exigir reiniciarla para aplicar el permiso la
   primera vez.

El botón "Move mouse" ya invoca `ensureAccessibilityPermission()`, que dispara
automáticamente este diálogo si el permiso aún no está concedido.

> El App Sandbox está **desactivado** a propósito: es incompatible con el envío de
> eventos de ratón. Por eso la app no puede publicarse en la Mac App Store, pero
> sí funciona para uso local y distribución directa.

---

## 4. Firmar y notarizar (para distribuir fuera de tu Mac)

Solo necesario si vas a compartir el `.app` con otras personas. Para uso propio
puedes saltarte esta sección.

### 4.1 Firmar con Developer ID

Localiza la identidad de firma disponible:

```bash
security find-identity -v -p codesigning
```

Firma la app con hardened runtime y el fichero de entitlements del proyecto:

```bash
codesign --force --deep --options runtime \
  --entitlements MoveMouse/MoveMouse.entitlements \
  --sign "Developer ID Application: TU NOMBRE (TEAMID)" \
  build/Build/Products/Release/MoveMouse.app
```

Verifica la firma:

```bash
codesign --verify --strict --verbose=2 build/Build/Products/Release/MoveMouse.app
```

### 4.2 Notarizar con Apple

Comprime la app y envíala a notarizar (necesitas un
[app-specific password](https://support.apple.com/en-us/102654) o una clave de la
App Store Connect API):

```bash
# Guarda las credenciales una vez:
xcrun notarytool store-credentials "notary-profile" \
  --apple-id "tu-apple-id@ejemplo.com" \
  --team-id "TEAMID" \
  --password "app-specific-password"

# Comprime y envía:
ditto -c -k --keepParent \
  build/Build/Products/Release/MoveMouse.app MoveMouse.zip

xcrun notarytool submit MoveMouse.zip \
  --keychain-profile "notary-profile" --wait
```

### 4.3 Grapar el ticket

Una vez aprobada la notarización, grapa el ticket al `.app` para que funcione sin
conexión:

```bash
xcrun stapler staple build/Build/Products/Release/MoveMouse.app
```

---

## 5. Resumen rápido

| Objetivo | Qué hacer |
|---|---|
| Probarla en tu Mac | Xcode → Run, y conceder Accesibilidad |
| Build por terminal | `xcodebuild ... -configuration Release` |
| Que el ratón se mueva | Ajustes → Privacidad y seguridad → Accesibilidad → MoveMouse + relanzar |
| Compartirla con otros | Firmar (Developer ID) → notarizar → grapar |
