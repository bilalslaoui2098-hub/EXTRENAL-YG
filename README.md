# HYperRegedit / 3105

هذا هو المشروع الكامل المرسل في أرشيف MediaFire، وليس نموذجًا جديدًا. يحتوي على مشروع Xcode الأصلي، الشاشات، الخدمات، الأصول، ملفات الـpatch، ووحدات العمل الداخلية.

## البنية

- `ThreeOneOSFive/views`: واجهات التطبيق ونظام التصميم.
- `ThreeOneOSFive/helpers`: الخدمات الداخلية مثل إدارة الملفات، المشاريع، التنظيف، التخزين، الأرشفة، وإدارة التفعيل.
- `ThreeOneOSFive/Assets.xcassets`: الأيقونات والصور والخلفيات.
- `ThreeOneOSFive/Patches`: حزم patch المضمنة في التطبيق.
- `ThreeOneOSFive/exploit` و`ThreeOneOSFive/kexploit`: ملفات الدعم الأصلية للمشروع كما وردت في المصدر.
- `ThreeOneOSFive.xcodeproj`: مشروع Xcode الكامل.
- `build_unsigned.sh`: بناء IPA غير موقّع على macOS.

## التفعيل

تم استبدال التحقق الشبكي بمدير تفعيل محلي داخل `helpers/LicenseManager.swift`. لا يحتاج التطبيق إلى API server لتفعيل الترخيص، والمفتاح المقبول هو:

```text
M3SBxYAGAMI
```

يحفظ التفعيل في Keychain على الجهاز، ويمكن إزالة التفعيل من داخل التطبيق عبر `deactivate()`.

## البناء

يتطلب البناء جهاز macOS مع Xcode. يمكن تشغيل:

```bash
./build_unsigned.sh
```

For the manual `build-unsigned-ipa.yml` workflow, create the source archive from
the project root so the Xcode project bundle is included:

```bash
./prepare_project_zip.sh
```

Upload `ThreeOneOSFive-project.zip`, then provide its HTTPS URL and SHA-256
checksum to the workflow. The archive must contain
`ThreeOneOSFive.xcodeproj/project.pbxproj`.

ثم استخدام GitHub Actions من خلال Workflow البناء الموجود في `.github/workflows/build.yml`.
