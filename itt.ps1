<#
    .NOTES
    Devloper  : @emadadel
    Github    : https://github.com/emadadel4
#>
#===========================================================================
#region Begin Start
#===========================================================================
param (
    # debug start
    [switch]$Debug,
    # debug end
    # Quick install
    [string]$i
)

# Load DLLs
Add-Type -AssemblyName 'System.Windows.Forms', 'PresentationFramework', 'PresentationCore', 'WindowsBase','System.Net.Http'

# Synchronized Hashtable for shared variables
$itt = [Hashtable]::Synchronized(@{

    database       = @{}
    ProcessRunning = $false
    lastupdate     = "08/10/2025"
    registryPath   = "HKCU:\Software\ITT@emadadel"
    icon           = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico"
    Theme          = "default"
    Date           = (Get-Date -Format "MM/dd/yyy")
    Music          = "0"
    PopupWindow    = "0"
    Language       = "default"
    ittDir         = "$env:ProgramData\itt\"
    command        = "$($MyInvocation.MyCommand.Definition)"
})

# Ask user for administrator privileges if not already running as admin
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process -FilePath "PowerShell" -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command `"$($MyInvocation.MyCommand.Definition)`"" -Verb RunAs
    exit

}

$itt.mediaPlayer = New-Object -ComObject WMPlayer.OCX
$Host.UI.RawUI.WindowTitle = "Install Twaeks Tool"

# Create directory if it doesn't exist
$ittDir = $itt.ittDir
if (-not (Test-Path -Path $ittDir)) {New-Item -ItemType Directory -Path $ittDir -Force | Out-Null}

# Trace the script
$logDir = Join-Path $ittDir 'logs'
$timestamp = Get-Date -Format "yyyy-MM-dd"
Start-Transcript -Path "$logDir\log_$timestamp.log" -Append -NoClobber *> $null
#===========================================================================
#endregion End Start
#===========================================================================
#===========================================================================
#region Begin localization
#===========================================================================
$itt.database.locales = @'
{"Controls":{"ar":{"name":"عربي","Welcome":"توفر هذه الأداة تسهيلات كبيرة في عملية تثبيت البرامج وتحسين الويندوز. انضم إلينا وكن جزءًا في تطويرها","System_Info":"معلومات النظام","Power_Options":"خيارات الطاقة","Device_Manager":"إدارة الأجهزة","Services":"خدمات","Networks":"شبكات","Apps_features":"التطبيقات و الميزات","Task_Manager":"مدير المهام","Disk_Managment":"إدارة القرص","Msconfig":"تكوين النظام","Environment_Variables":"متغيرات بيئة النظام","Install":"تثبيت","Apply":"تطبيق","Downloading":"...جارٍ التحميل","About":"عن الاداة","Third_party":"ادوات اخرى","Preferences":"التفضيلات","Management":"إدارة الجهاز","Apps":"برامج","Tweaks":"تحسينات","Settings":"إعدادات","Save":"حفظ البرامج","Restore":"أسترجاع البرامج","Music":"الموسيقى","On":"تشغيل ","Off":"كتم","Dark":"ليلا","Light":"نهارا","Use_system_setting":"استخدم إعدادات النظام","Create_desktop_shortcut":"أنشاء أختصار على سطح المكتب","Reset_preferences":"إعادة التفضيلات إلى الوضع الافتراضي","Reopen_itt_again":"يرجى اعادة فتح الاداة مرة اخرى","Theme":"المظهر","Language":"اللغة","Browsers_extensions":"أضافات المتصفحات","All":"الكل","Search":"بحث","Create_restore_point":"إنشاء نقطة الاستعادة","Portable_Downloads_Folder":"مجلد التنزيلات المحمولة","Install_msg":"هل تريد تثبيت البرامج التالية","Apply_msg":"هل تريد تطبيق التحسينات التالية","Applying":"...جارٍي التطبيق","Please_wait":"يرجى الانتظار، يوجد عملية في الخلفية","Last_update":"آخر تحديث","Exit_msg":"هل أنت متأكد من رغبتك في إغلاق البرنامج؟ إذا كان هناك أي تثبيتات، فسيتم إيقافها.","Empty_save_msg":"يرجى اختيار تطبيق واحد على الاقل لحفظه","easter_egg":"تقدر تكتشف الميزة المخفية؟ تصفح الكود، وكن أول واحد يكتشف الميزة، ويضيفها للأداة","system_protection":"حماية النظام","web browsers":"متصفحات","media":"مشغل","media tools":"أدوات الفيديو","documents":"المستندات","compression":"الضغط","communication":"الاتصال","file sharing":"مشاركة الملفات","imaging":"صور","gaming":"ألعاب","utilities":"أدوات النظام","disk tools":"أدوات القرص","development":"تطوير","security":"حماية","portable":"محمولة","runtimes":"مكاتب","drivers":"تعريفات","privacy":"الخصوصية","fixer":"المصحح","performance":"الأداء","personalization":"التخصيص","power":"الطاقة","protection":"حماية","classic":"كلاسيكي","auto":"تلقائي","package_manager":"مدير الحزم"},"de":{"name":"Deutsch","Welcome":"Sparen Sie Zeit indem Sie mehrere Programme gleichzeitig instAllieren und die Leistung Ihres Windows steigern. Schließen Sie sich uns an um dieses Tool zu verbessern und noch besser zu machen. Sie können auch Ihre Lieblings-Musik-Apps und Anpassungen hinzufügen.","Install":"InstAllieren","Apply":"Anwenden","Downloading":"Herunterladen...","About":"Über","Third_party":"Drittanbieter","Preferences":"Einstellungen","Management":"Verwaltung","Apps":"Apps","Tweaks":"Optimierungen","Settings":"Einstellungen","Save":"Speichern","Restore":"Wiederherstellen","Music":"Musik","On":"Ein","Off":"Aus","Disk_Managment":"Datenträgerverwaltung","Msconfig":"Systemkonfiguration","Environment_Variables":"Umgebungsvariablen","Task_Manager":"Task-Manager","Apps_features":"Apps-FunktiOnen","Networks":"Netzwerke","Services":"Dienste","Device_Manager":"Geräte-Manager","Power_Options":"EnergieoptiOnen","System_Info":"Systeminfo","Use_system_setting":"Systemeinstellungen verwenden","Create_desktop_shortcut":"Desktop-Verknüpfung erstellen","Reset_preferences":"Einstellungen zurücksetzen","Reopen_itt_again":"Bitte ITT erneut öffnen.","Theme":"Thema","Language":"Sprache","Browsers_extensions":"Browser-Erweiterungen","All":"Alle","Search":"Suchen","Create_restore_point":"Wiederherstellungspunkt erstellen","Portable_Downloads_Folder":"Ordner für tragbare Downloads","Install_msg":"Sind Sie sicher  dass Sie die folgenden Anwendungen instAllieren möchten?","Apply_msg":"Sind Sie sicher dass Sie die folgenden Anpassungen anwenden möchten?","Applying":"Anwenden...","Please_wait":"Bitte warten ein Prozess läuft im Hintergrund","Last_update":"Letztes Update","Exit_msg":"Sind Sie sicher dass Sie das Programm schließen möchten? Alle InstAllatiOnen werden abgebrochen.","Empty_save_msg":"Wählen Sie mindestens eine App zum Speichern aus","easter_egg":"Kannst du das verborgene Geheimnis entdecken? Tauche in den Quellcode ein sei der erste der die Funktion entdeckt und integriere sie in das Tool","system_protection":"Systemschutz","web browsers":"Webbrowser","media":"Medien","media tools":"Medienwerkzeuge","documents":"Dokumente","compression":"Komprimierung","communication":"Kommunikation","file sharing":"Dateifreigabe","imaging":"Bildbearbeitung","gaming":"Spiele","utilities":"Dienstprogramme","disk tools":"Laufwerkswerkzeuge","development":"Entwicklung","security":"Sicherheit","portable":"Tragbar","runtimes":"Laufzeitumgebungen","drivers":"Treiber","privacy":"Datenschutz","fixer":"Reparierer","performance":"Leistung","personalization":"Personalisierung","power":"Energie","protection":"Schutz","classic":"Klassisch","auto":"automatisch","package_manager":"Manager der Pakete"},"en":{"name":"English","Welcome":"Save time and install all your programs at once and debloat Windows and more. Be part of ITT and contribute to improving it","Install":"Install","Apply":"Apply","Downloading":"Downloading...","About":"About","Third_party":"Third-party","Preferences":"Preferences","Management":"Management","Apps":"Apps","Tweaks":"Tweaks","Settings":"Settings","Save":"Save","Restore":"Restore","Music":"Music","On":"On","Off":"Off","Disk_Managment":"Disk Managment","Msconfig":"System Configuration","Environment_Variables":"Environment Variables","Task_Manager":"Task Manager","Apps_features":"Programs and Features","Networks":"Networks","Services":"Services","Device_Manager":"Device Manager","Power_Options":"Power options","System_Info":"System Info","Use_system_setting":"Use system setting","Create_desktop_shortcut":"Create desktop shortcut","Reset_preferences":"Reset Preferences","Reopen_itt_again":"Please reopen itt again.","Theme":"Theme","Language":"Language","Browsers_extensions":"Browsers extensions","All":"All","Search":"Search","Create_restore_point":"Create a restore point","Portable_Downloads_Folder":"Portable Downloads Folder","Install_msg":"Are you sure you want to install the following App(s)","Apply_msg":"Are you sure you want to apply the following Tweak(s)","Applying":"Applying...","Please_wait":"Please wait a process is running in the background","Last_update":"Last update","Exit_msg":"Are you sure you want to close the program? Any ongoing installations will be canceled","Empty_save_msg":"Choose at least One app to save it","easter_egg":"Can you uncover the hidden secret? Dive into the source code be the first to discover the feature and integrate it into the tool","system_protection":"System protection","web browsers":"Web Browsers","media":"Media","media tools":"Media Tools","documents":"Documents","compression":"Compression","communication":"Communication","file sharing":"File Sharing","imaging":"Imaging","gaming":"Gaming","utilities":"Utilities","disk tools":"Disk Tools","development":"Development","security":"Security","portable":"Portable","runtimes":"Runtimes","drivers":"Drivers","privacy":"Privacy","fixer":"Fixer","performance":"Performance","personalization":"Personalization","power":"Power","protection":"Protection","classic":"Classic","auto":"Auto","package_manager":"Package Manager"},"es":{"name":"Español","Welcome":"Ahorra tiempo instalando varios prograMAS a la vez y mejora el rendimiento de tu Windows. Únete a nosotros para mejorar esta herramienta y hacerla aún mejor. También puedes agregar tus aplicaciOnes Musicales y ajustes favoritos.","Install":"Instalar","Apply":"Aplicar","Downloading":"Descargando...","About":"Acerca de","Third_party":"Terceros","Preferences":"Preferencias","Management":"Gestión","Apps":"AplicaciOnes","Tweaks":"Ajustes","Settings":"COnfiguración","Save":"Guardar","Restore":"Restaurar","Music":"Música","On":"Encendido","Off":"Apagado","Disk_Managment":"Administración de discos","Msconfig":"Configuración del sistema","Environment_Variables":"Variables de entorno","Task_Manager":"Administrador de tareas","Apps_features":"AplicaciOnes-FunciOnes","Networks":"Redes","Services":"Servicios","Device_Manager":"Administrador de dispositivos","Power_Options":"OpciOnes de energía","System_Info":"Información del sistema","Use_system_setting":"Usar la cOnfiguración del sistema","Create_desktop_shortcut":"Crear acceso directo en el escritorio","Reset_preferences":"Restablecer preferencias","Reopen_itt_again":"Vuelve a abrir ITT.","Theme":"Tema","Language":"Idioma","Browsers_extensions":"ExtensiOnes del navegador","All":"Todos","Search":"Buscar","Create_restore_point":"Crear un punto de restauración","Portable_Downloads_Folder":"Carpeta de descargas portátiles","Install_msg":"¿Estás seguro de que deseas instalar las siguientes aplicaciOnes?","Apply_msg":"¿Estás seguro de que deseas aplicar los siguientes ajustes?","Applying":"Aplicando...","Please_wait":"Por favorespera un proceso se está ejecutando en segundo plano.","Last_update":"Última actualización","Exit_msg":"¿Estás seguro de que deseas cerrar el programa? Si hay instalaciOnes se interrumpirán.","Empty_save_msg":"Elige al menos una aplicación para guardarla.","easter_egg":"¿Puedes descubrir el secreto oculto? Sumérgete en el código fuente sé el primero en descubrir la función e intégrala en la herramienta","system_protection":"Protección del sistema","web browsers":"Navegadores web","media":"Medios","media tools":"Herramientas multimedia","documents":"Documentos","compression":"Compresión","communication":"Comunicación","file sharing":"Compartición de archivos","imaging":"Imágenes","gaming":"Juegos","utilities":"Utilidades","disk tools":"Herramientas de disco","development":"Desarrollo","security":"Seguridad","portable":"Portátil","runtimes":"Runtimes","drivers":"Controladores","privacy":"Privacidad","fixer":"Reparador","performance":"Rendimiento","personalization":"Personalización","power":"Potencia","protection":"Protección","classic":"Clásico","auto":"automático","package_manager":"Manager de paquetes"},"fr":{"name":"Français","Welcome":"Gagnez du temps en instAllant plusieurs programmes à la fois et améliorez les performances de votre Windows. Rejoignez-nous pour améliorer cet outil et le rendre encore meilleur. Vous pouvez également ajouter vos applicatiOns Musicales et vos Tweaks préférés.","Install":"InstAller","Apply":"Appliquer","Downloading":"Téléchargement...","About":"À propos","Third_party":"Tiers","Preferences":"Préférences","Management":"GestiOn","Apps":"ApplicatiOns","Tweaks":"OptimisatiOns","Settings":"Paramètres","Save":"Sauvegarder","Restore":"Restaurer","Music":"Musique","On":"Activé","Off":"Désactivé","Disk_Managment":"GestiOn des disques","Msconfig":"Configuration du système","Environment_Variables":"Variables d'environnement","Task_Manager":"GestiOnnaire des tâches","Apps_features":"ApplicatiOns-FOnctiOnnalités","Networks":"Réseaux","Services":"Services","Device_Manager":"GestiOnnaire de périphériques","Power_Options":"OptiOns d'alimentatiOn","System_Info":"Infos système","Use_system_setting":"Utiliser les paramètres système","Create_desktop_shortcut":"Créer un raccourci sur le bureau","Reset_preferences":"Réinitialiser les préférences","Reopen_itt_again":"Veuillez rouvrir ITT.","Theme":"Thème","Language":"Langue","Browsers_extensions":"Browsers_extensions de navigateurs","All":"Tout","Search":"Rechercher","Create_restore_point":"Créer un point de restauratiOn","Portable_Downloads_Folder":"Dossier de téléchargements portables","Install_msg":"Êtes-vous sûr de vouloir instAller les applicatiOns suivantes ?","Apply_msg":"Êtes-vous sûr de vouloir appliquer les Tweaks suivants ?","Applying":"ApplicatiOn...","Please_wait":"Veuillez patienter","Last_update":"Dernière mise à jour  un processus est en cours d'exécutiOn en arrière-plan.","Exit_msg":"Êtes-vous sûr de vouloir fermer le programme ? Si des instAllatiOns sOnt en cours  elles serOnt interrompues","Empty_save_msg":"Choisissez au moins une applicatiOn à sauvegarder","easter_egg":"Peux-tu découvrir le secret caché ? Plonge dans le code source sois le premier à découvrir la fonctionnalité et intègre-la dans l'outil","system_protection":"Protection du système","web browsers":"Navigateurs Web","media":"Médias","media tools":"Outils multimédias","documents":"Documents","compression":"Compression","communication":"Communication","file sharing":"Partage de fichiers","imaging":"Imagerie","gaming":"Jeux","utilities":"Utilitaires","disk tools":"Outils de disque","development":"Développement","security":"Sécurité","portable":"Portable","runtimes":"Runtimes","drivers":"Pilotes","privacy":"Confidentialité","fixer":"Réparateur","performance":"Performance","personalization":"Personnalisation","power":"Puissance","protection":"Protection","classic":"Classique","auto":"automatique","package_manager":"Manager des paquets"},"hi":{"name":"अंग्रेज़ी","Welcome":"एक बार में कई प्रोग्राम इंस्टॉल करके समय बचाएं और अपने विंडोज़ के प्रदर्शन को बढ़ावा दें। इस टूल को बेहतर बनाने और इसे और अच्छा बनाने में हमारा साथ दें। आप अपने पसंदीदा म्यूज़िक ऐप्स और ट्विक्स भी जोड़ सकते हैं।","Install":"इंस्टॉल करें","Apply":"लागू करें","Downloading":"डाउनलोड हो रहा है...","About":"के बारे में","Third_party":"थर्ड-पार्टी","Preferences":"पसंद","Management":"प्रबंधन","Apps":"ऐप्स","Tweaks":"ट्विक्स","Settings":"सेटिंग्स","Save":"सहेजें","Restore":"पुनर्स्थापित करें","Music":"संगीत","On":"चालू","Off":"बंद","Disk_Managment":"डिस्क प्रबंधन","Msconfig":"सिस्टम कॉन्फ़िगरेशन","Environment_Variables":"एन्विर्बल वार्डियल्स","Task_Manager":"टास्क मैनेजर","Apps_features":"ऐप्स-फीचर्स","Networks":"नेटवर्क्स","Services":"सेवाएँ","Device_Manager":"डिवाइस मैनेजर","Power_Options":"पावर विकल्प","System_Info":"सिस्टम जानकारी","Use_system_setting":"सिस्टम सेटिंग का उपयोग करें","Create_desktop_shortcut":"डेस्कटॉप शॉर्टकट बनाएं","Reset_preferences":"पसंद रीसेट करें","Reopen_itt_again":"कृपया इसे फिर से खोलें।","Theme":"थीम","Language":"भाषा","Browsers_extensions":"ब्राउज़र एक्सटेंशन","All":"सभी","Search":"खोज","Create_restore_point":"पुनर्स्थापना बिंदु बनाएँ","Portable_Downloads_Folder":"पोर्टेबल डाउनलोड फ़ोल्डर","Install_msg":"क्या आप निश्चित हैं कि आप निम्न ऐप्स इंस्टॉल करना चाहते हैं?","Apply_msg":"क्या आप निश्चित हैं कि आप निम्न ट्विक्स लागू करना चाहते हैं?","Applying":"लागू किया जा रहा है...","Please_wait":"कृपया प्रतीक्षा करें बैकग्राउंड में एक प्रक्रिया चल रही है","Last_update":"आखिरी अपडेट","Exit_msg":"क्या आप निश्चित हैं कि आप प्रोग्राम बंद करना चाहते हैं? यदि कोई इंस्टॉलेशन चल रहा हो तो वह समाप्त हो जाएगा","Empty_save_msg":"कम से कम एक ऐप चुनें और उसे सहेजें।","easter_egg":"क्या आप छिपे हुए रहस्य को उजागर कर सकते हैं? सोर्स कोड में डूबकी लगाएं पहले व्यक्ति बनें जो फीचर को खोजे और इसे टूल में इंटीग्रेट करें","system_protection":"सिस्टम सुरक्षा","web browsers":"वेब ब्राउज़र","media":"मीडिया","media tools":"मीडिया उपकरण","documents":"दस्तावेज़","compression":"संपीड़न","communication":"संचार","file sharing":"फ़ाइल साझा करना","imaging":"इमेजिंग","gaming":"गेमिंग","utilities":"उपयोगिताएँ","disk tools":"डिस्क उपकरण","development":"विकास","security":"सुरक्षा","portable":"पोर्टेबल","runtimes":"रनटाइम्स","drivers":"ड्राइवर","privacy":"गोपनीयता","fixer":"ठीक करने वाला","performance":"प रदर्शन","personalization":"वैयक्तिकरण","power":"शक्ति","protection":"सुरक्षा","classic":"क्लासिक","auto":"स्वचालित","package_manager":"पैकेज मैनेजर"},"it":{"name":"Italiano","Welcome":"Risparmia tempo installando più programmi contemporaneamente e migliora le prestazioni di Windows. Unisciti a noi per migliorare questo strumento e renderlo migliore. Puoi anche aggiungere le tue app musicali preferite e le personalizzazioni.","Install":"Installa","Apply":"Applica","Downloading":"Download in corso...","About":"Informazioni","Third_party":"Terze parti","Preferences":"Preferenze","Management":"Gestione","Apps":"App","Tweaks":"Personalizzazioni","Settings":"Impostazioni","Save":"Salva","Restore":"Ripristina","Music":"Musica","On":"Acceso","Off":"Spento","Disk_Managment":"Gestione disco","Msconfig":"Configurazione di sistema","Environment_Variables":"Variabili di ambiente","Task_Manager":"Gestore attività","Apps_features":"App-Funzionalità","Networks":"Reti","Services":"Servizi","Device_Manager":"Gestore dispositivi","Power_Options":"Opzioni risparmio energia","System_Info":"Informazioni di sistema","Use_system_setting":"Usa impostazioni di sistema","Create_desktop_shortcut":"Crea collegamento sul desktop","Reset_preferences":"Reimposta preferenze","Reopen_itt_again":"Per favore riapri di nuovo.","Theme":"Tema","Language":"Lingua","Browsers_extensions":"Estensioni per browser","All":"Tutti","Search":"Cerca","Create_restore_point":"Crea un punto di ripristino","Portable_Downloads_Folder":"Cartella download portatile","Install_msg":"Sei sicuro di voler installare le seguenti app?","Apply_msg":"Sei sicuro di voler applicare le seguenti personalizzazioni?","Applying":"Applicazione in corso...","Please_wait":"Attendere un processo è in corso in background","Last_update":"Ultimo aggiornamento","Exit_msg":"Sei sicuro di voler chiudere il programma? Se ci sono installazioni in corso verranno terminate.","Empty_save_msg":"Scegli almeno un'app per salvarla.","easter_egg":"Riuscirai a scoprire il segreto nascosto? Tuffati nel codice sorgente sii il primo a scoprire la funzionalità e integrala nello strumento","system_protection":"Protezione del sistema","web browsers":"Browser Web","media":"Media","media tools":"Strumenti Media","documents":"Documenti","compression":"Compressione","communication":"Comunicazione","file sharing":"Condivisione File","imaging":"Imaging","gaming":"Giochi","utilities":"Utilità","disk tools":"Strumenti Disco","development":"Sviluppo","security":"Sicurezza","portable":"Portatile","runtimes":"Runtime","drivers":"Driver","privacy":"Privacy","fixer":"Riparatore","performance":"Prestazioni","personalization":"Personalizzazione","power":"Potenza","protection":"Protezione","classic":"Classico","auto":"automatico","package_manager":"Gestore pacchetti"},"ko":{"name":"한국어","Welcome":"여러 프로그램을 한 번에 설치하여 시간을 절약하고 Windows 성능을 향상시킵니다. 도구를 개선하고 우리와 함께 훌륭하게 만들어 보세요.","System_Info":"시스템 정보","Power_Options":"전원 옵션","Device_Manager":"장치 관리자","Services":"서비스","Networks":"네트워크","Apps_features":"앱 기능","Task_Manager":"작업 관리자","Disk_Managment":"디스크 관리","Msconfig":"시스템 구성","Environment_Variables":"연습별 변수","Install":"설치","Apply":"적용","Downloading":"다운로드 중","About":"정보","Third_party":"외부","Preferences":"환경 설정","Management":"관리","Apps":"앱","Tweaks":"설정","Settings":"설정","Save":"선택한 앱 저장","Restore":"선택한 앱 복원","Music":"음악","On":"켜기","Reset_preferences":"환경 설정 초기화","Off":"끄기","Dark":"다크","Light":"라이트","Use_system_setting":"시스템","Create_desktop_shortcut":"바탕화면 바로 가기 만들기","Reopen_itt_again":"ITT를 다시 열어주세요.","Theme":"테마","Language":"언어","Browsers_extensions":"브라우저 확장 프로그램","All":"모두","Create_restore_point":"복원 지점 생성","Portable_Downloads_Folder":"휴대용 다운로드 폴더","Install_msg":"선택한 앱을 설치하시겠습니까","Apply_msg":"선택한 조정 사항을 적용하시겠습니까","instAlling":"설치 중..","Applying":"적용 중..","Please_wait":"배경에서 프로세스가 진행 중입니다. 잠시 기다려주세요.","Last_update":"마지막 업데이트","Exit_msg":"프로그램을 종료하시겠습니까? 진행 중인 설치가 있으면 중단됩니다.","easter_egg":"숨겨진 비밀을 발견할 수 있습니다. 소스 코드에 뛰어들고 최초로 기능을 발견하고 도구에 통합하세요","system_protection":"웹 보호","web browsers":"웹 브라우저","media":"미디어","media tools":"미디어 도구","documents":"문서","compression":"압축","communication":"커뮤니케이션","file sharing":"파일 공유","imaging":"이미지 처리","gaming":"게임","utilities":"유틸리티","disk tools":"디스크 도구","development":"개발","security":"보호","portable":"포터블","runtimes":"런타임","drivers":"드라이버","privacy":"개인 정보 보호","fixer":"수리공","performance":"성능","personalization":"개인화","power":"전력","protection":"보호","classic":"클래식","auto":"자동","package_manager":"패키지 관리자"},"ru":{"name":"Русский","Welcome":"Сэкономьте время устанавливая несколько программ одновременно и улучшите производительность Windows. Присоединяйтесь к нам для улучшения этого инструмента и его совершенствования. Вы также можете добавить свои любимые музыкальные приложения и настройки.","Install":"Установить","Apply":"Применить","Downloading":"Загрузка...","About":"О нас","Third_party":"Сторонние","Preferences":"Настройки","Management":"Управление","Apps":"Приложения","Tweaks":"Настройки","Settings":"Параметры","Save":"Сохранить","Restore":"Восстановить","Music":"Музыка","On":"Вкл","Off":"Выкл","Disk_Managment":"Управление дисками","Msconfig":"Конфигурация системы","Environment_Variables":"Переменные окружения","Task_Manager":"Диспетчер задач","Apps_features":"Приложения-Функции","Networks":"Сети","Services":"Сервисы","Device_Manager":"Диспетчер устройств","Power_Options":"Энергопитание","System_Info":"Информация о системе","Use_system_setting":"Использовать системные настройки","Create_desktop_shortcut":"Создать ярлык на рабочем столе","Reset_preferences":"Сбросить настройки","Reopen_itt_again":"Пожалуйста перезапустите ITT.","Theme":"Тема","Language":"Язык","Browsers_extensions":"Расширения для браузеров","All":"Все","Search":"Поиск","Create_restore_point":"Создать точку восстановления","Portable_Downloads_Folder":"Папка для портативных загрузок","Install_msg":"Вы уверены что хотите установить следующие приложения?","Apply_msg":"Вы уверены что хотите применить следующие настройки?","Applying":"Применение...","Please_wait":"Подождите выполняется фоновый процесс.","Last_update":"Последнее обновление","Exit_msg":"Вы уверены что хотите закрыть программу? Все установки будут прерваны.","Empty_save_msg":"Выберите хотя бы одно приложение для сохранения","easter_egg":"Можешь ли ты раскрыть скрытый секрет? Погрузись в исходный код стань первым кто обнаружит функцию и интегрируй её в инструмент","system_protection":"Системная защита","web browsers":"Веб-браузеры","media":"Медиа","media tools":"Медиа-инструменты","documents":"Документы","compression":"Архивация","communication":"Связь","file sharing":"Обмен файлами","imaging":"Обработка изображений","gaming":"Игры","utilities":"Утилиты","disk tools":"Работа с дисками","development":"Разработка","security":"Безопасность","portable":"Портативные","runtimes":"Среды выполнения","drivers":"Драйверы","privacy":"Конфиденциальность","fixer":"Исправитель","performance":"Производительность","personalization":"Персонализация","power":"Мощность","protection":"Защита","classic":"Классический","auto":"Автоматический","package_manager":"Менеджер пакетов"},"tr":{"name":"Türkçe","Welcome":"Birden fazla programı aynı anda yükleyerek zaman kazanın ve Windows performansınızı artırın. Bu aracı geliştirmek ve daha da iyileştirmek için bize katılın. Ayrıca favori müzik uygulamalarınızı ve ayarlarınızı da ekleyebilirsiniz.","Install":"Yükle","Apply":"Uygula","Downloading":"İndiriliyor...","About":"Hakkında","Third_party":"Üçüncü Taraf","Preferences":"Tercihler","Management":"Yönetim","Apps":"Uygulamalar","Tweaks":"İnce Ayarlar","Settings":"Ayarlar","Save":"Kayıt Et","Restore":"Geri Yükle","Music":"Müzik","On":"Açık","Off":"Kapalı","Disk_Managment":"Disk Yönetimi","Msconfig":"Sistem Yapılandırması","Environment_Variables":"Ortam Değişkenleri","Task_Manager":"Görev Yöneticisi","Apps_features":"Uygulamalar-Özellikler","Networks":"Ağlar","Services":"Hizmetler","Device_Manager":"Aygıt Yöneticisi","Power_Options":"Güç Seçenekleri","System_Info":"Sistem Bilgisi","Use_system_setting":"Sistem ayarlarını kullan","Create_desktop_shortcut":"MASaüstü kısayolu oluştur","Reset_preferences":"Tercihleri sıfırla","Reopen_itt_again":"Lütfen ITT'yi tekrar açın.","Theme":"Tema","Language":"Dil","Browsers_extensions":"Tarayıcı Eklentileri","All":"Tümü","Search":"Ara","Create_restore_point":"Geri yükleme noktası oluştur","Portable_Downloads_Folder":"Taşınabilir İndirilenler Klasörü","Install_msg":"Aşağıdaki uygulamaları yüklemek istediğinizden emin misiniz?","Apply_msg":"Aşağıdaki ayarları uygulamak istediğinizden emin misiniz?","Applying":"Uygulanıyor...","Please_wait":"Lütfen bekleyin arka planda bir işlem çalışıyor","Last_update":"SOn güncelleme","Exit_msg":"Programı kapatmak istediğinizden emin misiniz? Herhangi bir kurulum varsa durdurulacak","Empty_save_msg":"Kaydetmek için en az bir uygulama seçin","easter_egg":"Gizli sırrı keşfedebilir misin? Kaynağa dal özelliği ilk keşfeden ol ve araca entegre et","system_protection":"Sistem koruması","web browsers":"Web Tarayıcıları","media":"Medya","media tools":"Medya Araçları","documents":"Belgeler","compression":"Sıkıştırma","communication":"İletişim","file sharing":"Dosya Paylaşımı","imaging":"Görüntü İşleme","gaming":"Oyun","utilities":"Araçlar","disk tools":"Disk Araçları","development":"Geliştirme","security":"Güvenlik","portable":"Taşınabilir","runtimes":"Çalışma Zamanı","drivers":"Sürücüler","privacy":"Gizlilik","fixer":"Düzeltici","performance":"Performans","personalization":"Kişiselleştirme","power":"Güç","protection":"Koruma","classic":"Klasik","auto":"otomatik","package_manager":"Paket Yöneticisi"},"zh":{"name":"中文","Welcome":"通过一次安装多个程序节省时间并提升您的Windows性能。加入我们，改进工具，使其更加优秀。","System_Info":"系统信息","Power_Options":"电源选项","Device_Manager":"设备管理器","Services":"服务","Networks":"网络","Apps_features":"应用特性","Task_Manager":"任务管理器","Disk_Managment":"磁盘管理","Msconfig":"系统配置","Environment_Variables":"环境变量","Install":"安装","Apply":"应用","Downloading":"下载中","About":"关于","Third_party":"第三方","Preferences":"偏好","Management":"管理","Apps":"应用","Tweaks":"调整","Settings":"设置","Save":"保存选定应用","Restore":"恢复选定应用","Music":"音乐","On":"开启","Off":"关闭","Reset_preferences":"重置偏好设置","Dark":"深色","Light":"浅色","Use_system_setting":"系统","Create_desktop_shortcut":"创建桌面快捷方式","Reopen_itt_again":"请重新打开ITT。","Theme":"主题","Language":"语言","Browsers_extensions":"浏览器扩展","All":"都","Create_restore_point":"创建还原点","Portable_Downloads_Folder":"便携下载文件夹","Install_msg":"是否要安装选定的应用","Apply_msg":"是否要应用选定的调整","instAlling":"安装中..","Applying":"应用中..","Please_wait":"请等待，后台有进程在进行中。","Last_update":"最后更新","Exit_msg":"您确定要关闭程序吗？如果有任何安装正在进行，它们将被终止。","easter_egg":"你能发现隐藏的秘密吗？深入源代码，成为第一个发现功能的人，并将其集成到工具中","system_protection":"系统保护","web browsers":"网页浏览器","media":"媒体","media tools":"媒体工具","documents":"文档","compression":"压缩","communication":"通讯","file sharing":"文件共享","imaging":"图像处理","gaming":"游戏","utilities":"实用工具","disk tools":"磁盘工具","development":"开发","security":"安全","portable":"便携版","runtimes":"运行时","drivers":"驱动程序","privacy":"隐私","fixer":"修复工具","performance":"性能","personalization":"个性化","power":"电力","protection":"保护","classic":"经典","auto":"自动","package_manager":"包管理器"}}}

'@ | ConvertFrom-Json
#===========================================================================
#endregion End localization
#===========================================================================
#===========================================================================
#region Begin Main Functions
#===========================================================================
function Invoke-Button {

    <#
        .SYNOPSIS
            Handles various button actions and commands based on the specified action parameter.
        .EXAMPLE
            Invoke-Button -action "sysinfo"
    #>

    Param ([string]$action,[string]$Content)

    # debug start
    function Debug-Message {if($Debug) {  Add-Log "$action,$Content" -Level "Debug"  }}
    # debug end

    # Switch block to handle different actions
    Switch -Wildcard ($action) {
        "installBtn" {
            $itt.SearchInput.Text = $null
            Invoke-Install
        }
        "applyBtn" {
            Invoke-Apply
        }
        "$($itt.CurrentCategory)" {
            FilterByCat($itt["window"].FindName($itt.CurrentCategory).SelectedItem.Tag)
        }
        "searchInput" {
            Search
        }
        "auto" {
            Set-ItemProperty -Path $itt.registryPath -Name "source" -Value "auto" -Force
            Set-Statusbar -Text "📢 Switched to auto"
        }
        "choco" {
            Set-ItemProperty -Path $itt.registryPath -Name "source" -Value "choco" -Force
            Set-Statusbar -Text "📢 Switched to choco"
        }
        "winget" {
            Set-ItemProperty -Path $itt.registryPath -Name "source" -Value "winget" -Force
            Set-Statusbar -Text "📢 Switched to winget"
        }
        # Menu items
        "systemlang" {
            Set-Language -lang "default"
        }
                    "ar" {
                Set-Language -lang "ar"
                # debug start
                Debug-Message 
                # debug end
            }
            "de" {
                Set-Language -lang "de"
                # debug start
                Debug-Message 
                # debug end
            }
            "en" {
                Set-Language -lang "en"
                # debug start
                Debug-Message 
                # debug end
            }
            "es" {
                Set-Language -lang "es"
                # debug start
                Debug-Message 
                # debug end
            }
            "fr" {
                Set-Language -lang "fr"
                # debug start
                Debug-Message 
                # debug end
            }
            "hi" {
                Set-Language -lang "hi"
                # debug start
                Debug-Message 
                # debug end
            }
            "it" {
                Set-Language -lang "it"
                # debug start
                Debug-Message 
                # debug end
            }
            "ko" {
                Set-Language -lang "ko"
                # debug start
                Debug-Message 
                # debug end
            }
            "ru" {
                Set-Language -lang "ru"
                # debug start
                Debug-Message 
                # debug end
            }
            "tr" {
                Set-Language -lang "tr"
                # debug start
                Debug-Message 
                # debug end
            }
            "zh" {
                Set-Language -lang "zh"
                # debug start
                Debug-Message 
                # debug end
            }
        "save" {
            Save-File
        }
        "load" {
            Get-file
        }
        # Device Management
        "deviceManager" {
            Start-Process devmgmt.msc 
        }
        "appsfeatures" {
            Start-Process appwiz.cpl 
        }
        "sysinfo" {
            Start-Process msinfo32.exe
            Start-Process dxdiag.exe 
        }
        "poweroption" {
            Start-Process powercfg.cpl 
        }
        "services" {
            Start-Process services.msc 
        }
        "network" {
            Start-Process ncpa.cpl

        }
        "taskmgr" {
            Start-Process taskmgr.exe
        }
        "diskmgmt" {
            Start-Process diskmgmt.msc
        }
        "msconfig" {
            Start-Process msconfig.exe
        }
        "ev" {
            rundll32 sysdm.cpl,EditEnvironmentVariables
        }
        "spp" {
            systemPropertiesProtection
        }
        "systheme" {
            SwitchToSystem 
        }
                    "Dark" {
                Set-Theme -Theme $action
                # debug start
                Debug-Message
                # debug end
            }
            "DarkKnight" {
                Set-Theme -Theme $action
                # debug start
                Debug-Message
                # debug end
            }
            "Light" {
                Set-Theme -Theme $action
                # debug start
                Debug-Message
                # debug end
            }
            "Palestine" {
                Set-Theme -Theme $action
                # debug start
                Debug-Message
                # debug end
            }
        # chocoloc
        "chocoloc" {
            Start-Process explorer.exe "C:\ProgramData\chocolatey\lib"
        }
        # itt Dir
        "itt" {
            Start-Process explorer.exe $env:ProgramData\itt
        }
        # restore point
        "restorepoint" {
            ITT-ScriptBlock -ScriptBlock{CreateRestorePoint}
        }
        # Music
        "moff" {
            Manage-Music -action "SetVolume" -volume 0 
        }
        "mon" {
            Manage-Music -action "SetVolume" -volume 100 
        }
        # Mirror Links
        "unhook" {
            Start-Process "https://unhook.app/" 
        }
        "efy" {
            Start-Process "https://www.mrfdev.com/enhancer-for-youtube" 
        }
        "uBlock" {
            Start-Process "https://ublockorigin.com/" 
        }
        "mas" {
            Add-Log -Message "Microsoft Activation Scripts (MAS)" -Level "info"
            ITT-ScriptBlock -ScriptBlock {irm https://get.activated.win | iex}
        }
        "idm" {
            Add-Log -Message "Running IDM Activation..." -Level "info"
            ITT-ScriptBlock -ScriptBlock {curl.exe -L -o $env:TEMP\\IDM_Trial_Reset.exe "https://github.com/itt-co/itt-packages/raw/refs/heads/main/automation/idm-trial-reset/IDM%20Trial%20Reset.exe"; cmd /c "$env:TEMP\\IDM_Trial_Reset.exe"}
        }
        "winoffice" {
            Start-Process "https://massgrave.dev/genuine-installation-media" 
        }
        "sordum" {
            Start-Process "https://www.sordum.org/" 
        }
        "majorgeeks" {
            Start-Process "https://www.majorgeeks.com/" 
        }
        "techpowerup" {
            Start-Process "https://www.techpowerup.com/download/"
        }
        # Other actions
        "ittshortcut" {
            ITTShortcut $action
        }
        "dev" {
            About
        }
        "shelltube"{
            Start-Process -FilePath "powershell" -ArgumentList "irm https://github.com/emadadel4/shelltube/releases/latest/download/st.ps1 | iex"
        }
        "rapidos"{
            Start-Process ("https://github.com/rapid-community/RapidOS")
        }
        "asustool"{
            Start-Process ("https://github.com/codecrafting-io/asus-setup-tool")
        }
        "webtor"{
            Start-Process ("https://webtor.io/")
        }
        "spotifydown"{
            Start-Process ("https://spotidownloader.com/")
        }
        "finddriver"{
            Find-Driver
        }
        "taps"{
            ChangeTap
        }
        "telegram"{
            Start-Process("https://t.me/emadadel4")
        }
        "github"{
            Start-Process("https://github.com/emadadel4/itt")
        }
    }

    # debug start
        Debug-Message $action
    # debug end
}
function ITT-ScriptBlock {
    <#
        .SYNOPSIS
        Executes a given script block asynchronously within a specified runspace.
        .DESCRIPTION
        This function creates a new PowerShell instance to execute a provided script block asynchronously. It accepts an optional array of arguments to pass to the script block and manages the runspace and PowerShell instance resources. The function ensures that resources are properly disposed of after the script block completes execution.
        .EXAMPLE
        ITT-ScriptBlock -ScriptBlock { param($arg1) Write-Output $arg1 } -ArgumentList @("Hello, World!")
        Executes the script block that outputs the provided argument "Hello, World!" asynchronously.
    #>
    param(
        [scriptblock]$ScriptBlock,
        [array]$ArgumentList,
        $Debug
    )
    $script:powershell = [powershell]::Create()
    # Add the script block and arguments to the runspace
    $script:powershell.AddScript($ScriptBlock)
    $script:powershell.AddArgument($ArgumentList)
    $script:powershell.AddArgument($Debug)
    $script:powershell.RunspacePool = $itt.runspace
    # Begin running the script block asynchronously
    $script:handle = $script:powershell.BeginInvoke()
    # If the script has completed, clean up resources
    if ($script:handle.IsCompleted) {
        $script:powershell.EndInvoke($script:handle)
        $script:powershell.Dispose()
        $itt.runspace.Dispose()
        $itt.runspace.Close()
        [System.GC]::Collect()
    }

    return $handle
}
function CreateRestorePoint {

    <#
        .SYNOPSIS
        Create Restore Point
    #>

    try {
        Set-Statusbar -Text "✋ Please wait Creating a restore point..."
        Set-ItemProperty "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" "SystemRestorePointCreationFrequency" 0 -Type DWord -Force
        powershell.exe -NoProfile -Command {
            Enable-ComputerRestore -Drive $env:SystemDrive
            Checkpoint-Computer -Description ("ITT-" + (Get-Date -Format "yyyyMMdd-hhmmss-tt")) -RestorePointType "MODIFY_SETTINGS"
        }
        Set-ItemProperty $itt.registryPath "backup" 1 -Force
        Set-Statusbar -Text "✔ Created successfully. Applying tweaks..."
    } catch {
        Add-Log "Error: $_" "ERROR"
    }
}
function Add-Log {

    <#
        .SYNOPSIS
        Custom Write-Host Display Text with icon and name
    #>

    param ([string]$Message, [string]$Level = "Default")

    $level = $Level.ToUpper()
    $colorMap = @{ INFO="White"; WARNING="Yellow"; ERROR="Red"; INSTALLED="White"; APPLY="White"; DEBUG="Yellow" }
    $iconMap  = @{ INFO="[INFO]"; WARNING="[!]"; ERROR="[X]"; DEFAULT=""; DEBUG="[DEBUG]"; ITT="[ITT]"; Chocolatey="[Chocolatey]"; Winget="[Winget]" }

    $color = if ($colorMap.ContainsKey($level)) { $colorMap[$level] } else { "White" }
    $icon  = if ($iconMap.ContainsKey($level)) { $iconMap[$level] } else { "i" }

    Write-Host "$icon $Message" -ForegroundColor $color
}
function Disable-Service {
    
    <#
        .SYNOPSIS
        Disables a specified service by changing its startup type and stopping it.
        .DESCRIPTION
        This function disables a Windows service by first changing its startup type to the specified value, then stopping the service if it is running. The function logs the outcome of the operation, including whether the service was found and successfully disabled or if an error occurred.
        .PARAMETER ServiceName
        The name of the service to be disabled. This is a required parameter.
        .PARAMETER StartupType
        The desired startup type for the service. Common values include 'Disabled', 'Manual', and 'Automatic'. This is a required parameter.
        .EXAMPLE
        Disable-Service -ServiceName "wuauserv" -StartupType "Disabled"
    #>

    param([array]$tweak)

    foreach ($serv in $tweak) {
        try {
            Add-Log  -Message "Setting Service $($serv.Name)" -Level "info"
            $service = Get-Service -Name $serv.Name -ErrorAction Stop
            Stop-Service -Name $serv.Name -ErrorAction Stop
            $service | Set-Service -StartupType $serv.StartupType -ErrorAction Stop
        }
        catch {
            Add-Log -Message "Service $Name was not found" -Level "info"
        }
    }
}
function ExecuteCommand {

    <#
        .SYNOPSIS
        Executes a PowerShell command in a new process.
        .DESCRIPTION
        This function starts a new PowerShell process to execute the specified command.
        .EXAMPLE
        ExecuteCommand -Name "Greeting" -Command "Write-Output 'Welcome to ITT'"
        Executes the PowerShell command `Write-Output 'Welcome to ITT'` in a new PowerShell process.
    #>

    param ([array]$tweak)

    try {
        foreach ($cmd in $tweak) {
            Add-Log -Message "Please wait..."
            $script = [scriptblock]::Create($cmd)
            Invoke-Command  $script -ErrorAction Stop
        }
    } catch  {
        Add-Log -Message "The specified command was not found." -Level "WARNING"
    }
}
function Finish {
    
    <#
        .SYNOPSIS
        Clears checkboxes in a specified ListView and displays a notification.
        .DESCRIPTION
        Clears all checkboxes in the ListView named "myListView" and displays a notification with the title "Process Completed", message "All items have been processed", and icon "Success".
    #>

    param (
        [string]$ListView,
        [string]$title = "ITT Emad Adel",
        [string]$icon = "Info"
    )
    switch ($ListView) {
        "AppsListView" {
            UpdateUI -Button "InstallBtn" -Content "Install" -Width "140"
            Notify -title "$title" -msg "All installations have finished" -icon "Info" -time 30000
            Add-Log -Message "`n::::All installations have finished::::"
            Set-Statusbar -Text "📢 All installations have finished"
        }
        "TweaksListView" {
            UpdateUI -Button "ApplyBtn" -Content "Apply" -Width "140"
            Add-Log -Message "`n::::All tweaks have finished::::"
            Set-Statusbar -Text "📢 All tweaks have finished"
            Notify -title "$title" -msg "All tweaks have finished" -icon "Info" -time 30000
        }
    }

    # Reset Taskbar Progress
    $itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "None" -value 0.01 -icon "done" })

    # Uncheck all items in ListView
    $itt.$ListView.Dispatcher.Invoke([Action] {
            # Uncheck all items
            foreach ($item in $itt.$ListView.Items) {
                $item.IsChecked = $false
            }
            
            # Clear the list view selection and reset the filter
            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)
            $collectionView.Filter = $null
            $collectionView.Refresh()

            # Close window after install apps
            # if ($i -ne "") {
            #     Manage-Music -action "StopAll" 
            #     $itt["window"].Close()
            # }
        })
}
function Show-Selected {
    param (
        [string]$ListView,
        [string]$mode
    )

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)

    switch ($mode) {
        "Filter" {
            $collectionView.Filter = {
                param ($item)

                # Check if item is selected
                return $item.IsChecked -eq $true
            }
        }
        Default {

            $collectionView.Filter = {
                param ($item)

                # Uncheck all checkboxes
                $item.IsChecked = $false
            }

            # Reset collection view
            $collectionView.Filter = $null
        }
    }
}
function Get-SelectedItems {

    <#
        .SYNOPSIS
        Retrieves selected items from the ListView based on the specified mode.
        .DESCRIPTION
        This function collects information about selected items from a ListView, depending on the mode specified. It extracts data from the ListView items that have checkboxes that are checked and returns this information in a structured format.
        .EXAMPLE
        Get-SelectedItems -Mode "Apps"
        Retrieves and returns a list of selected applications from the `AppsListView`.
    #>
    
    param ([string]$Mode)

    switch ($Mode) {
        "Apps" {

            $Apps = @()  

            foreach ($item in $itt.AppsListView.Items) {
                
                if ($item.IsChecked) {

                    $Apps += @{
                        Name    = $item.Content
                        Choco   = $item.Choco
                        Scoop   = $item.Scoop
                        Winget  = $item.Winget
                        ITT     = $item.ITT
                    }
                }
            }

            return $Apps
        }
        "Tweaks" {

            $Tweaks = @()  

            foreach ($item in $itt.TweaksListView.Items) {
        
                if ($item.IsChecked) {

                    $Tweaks += @{
                        Name    = $item.Content
                        Script   = $item.script
                    }
                }
            }

            return $Tweaks
        }
    }
}
function Get-ToggleStatus {

    <#
        .SYNOPSIS
        Checks the status of various system toggle switches based on the provided parameter.
        .DESCRIPTION
        This function retrieves the status of the specified toggle switch.
        .EXAMPLE
        Get-ToggleStatus -ToggleSwitch "ToggleDarkMode"
    #>

    Param($ToggleSwitch)
    # Check status of "ToggleDarkMode"
    if ($ToggleSwitch -eq "darkmode") {
        $app = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').AppsUseLightTheme
        $system = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').SystemUsesLightTheme
        if ($app -eq 0 -and $system -eq 0) {
            return $true
        }
        else {
            # Return true if Sticky Keys are enabled
            return $false
        }
    }

    # Check status of "ToggleShowExt" (Show File Extensions)
    if ($ToggleSwitch -eq "showfileextensions") {
        $hideextvalue = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced').HideFileExt
        if ($hideextvalue -eq 0) {
            return $true
        }
        else {
            # Return true if Sticky Keys are enabled
            return $false
        }
    }

    # Check status of "showsuperhidden" (Show Hidden Files)
    if ($ToggleSwitch -eq "showsuperhidden") {
        $hideextvalue = (Get-ItemPropertyValue -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSuperHidden")
        if ($hideextvalue -eq 1) {
            return $true
        }
        else {
            # Return true if Sticky Keys are enabled
            return $false
        }
    }

    # Check status of "ToggleNumLock"
    if ($ToggleSwitch -eq "numlook") {
        $numlockvalue = (Get-ItemProperty -path 'HKCU:\Control Panel\Keyboard').InitialKeyboardIndicators
        if ($numlockvalue -eq 2) {
            return $true
        }
        else {
            # Return true if Sticky Keys are enabled
            return $false
        }
    } 

    # Check status of "ToggleStickyKeys"    
    if ($ToggleSwitch -eq "stickykeys") {
        $StickyKeys = (Get-ItemProperty -path 'HKCU:\Control Panel\Accessibility\StickyKeys').Flags
        if ($StickyKeys -eq 58) {
            return $false
        }
        else {
            # Return true if Sticky Keys are enabled
            return $true
        }
    }

    # Check status of "MouseAcceleration"    
    if ($ToggleSwitch -eq "mouseacceleration") {
        $Speed = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseSpeed
        $Threshold1 = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseThreshold1
        $Threshold2 = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseThreshold2
        if ($Speed -eq 1 -and $Threshold1 -eq 6 -and $Threshold2 -eq 10) {
            return $true
        }
        else {
            return $false
        }
    }

    # EndTaskOnTaskbar     
    if ($ToggleSwitch -eq "endtaskontaskbarwindows11") {
        $path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings"
        if (-not (Test-Path $path)) {
            return $false
        }
        else {
            $TaskBar = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings').TaskbarEndTask
            if ($TaskBar -eq 1) {
                return $true
            } 
            else {
                return $false
            }
        }
    }

    # Remove Page file     
    if ($ToggleSwitch -eq "clearpagefileatshutdown") {
        $PageFile = (Get-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\\Memory Management').ClearPageFileAtShutdown
        if ($PageFile -eq 1) {
            return $true
        } 
        else {
            return $false
        }
    }

    # Auto end tasks     
    if ($ToggleSwitch -eq "autoendtasks") {
        $PageFile = (Get-ItemProperty -path 'HKCU:\Control Panel\Desktop').AutoEndTasks
        if ($PageFile -eq 1) {
            return $true
        } 
        else {
            return $false
        }
    }

    # Performance Options     
    if ($ToggleSwitch -eq "performanceoptions") {
        $VisualFXSetting = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects').VisualFXSetting
        if ($VisualFXSetting -eq 2) {
            return $true
        } 
        else {
            return $false
        }
    }

    # Quick Access   
    if ($ToggleSwitch -eq "launchtothispc") {
        $LaunchTo = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced').LaunchTo
        if ($LaunchTo -eq 1) {
            return $true
        } 
        else {
            return $false
        }
    }

    # Disable Automatic Driver Installation
    if ($ToggleSwitch -eq "disableautomaticdriverinstallation") {
        $disableautomaticdrive = (Get-ItemProperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching').SearchOrderConfig
        if ($disableautomaticdrive -eq 1) {
            return $true
        } 
        else {
            return $false
        }
    }

    # Always show icons never thumbnail
    if ($ToggleSwitch -eq "AlwaysshowiconsneverThumbnail") {
        $alwaysshowicons = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced').IconsOnly
        if ($alwaysshowicons -eq 1) {
            return $true
        } 
        else {
            return $false
        }
    }

    # Core Isolation Memory Integrity
    if ($ToggleSwitch -eq "CoreIsolationMemoryIntegrity") {
        $CoreIsolationMemory = (Get-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard').Enabled
        if ($CoreIsolationMemory -eq 1) {
            return $true
        } 
        else {
            return $false
        }
        
    }

    # Windows Sandbox
    if ($ToggleSwitch -eq "WindowsSandbox") {
        $WS = Get-WindowsOptionalFeature -Online -FeatureName "Containers-DisposableClientVM"
        if ($WS.State -eq "Enabled") {
            return $true
        } 
        else {
            return $false
        }
    }

    # Windows Sandbox
    if ($ToggleSwitch -eq "WindowsSubsystemforLinux") {
        $WSL = Get-WindowsOptionalFeature -Online -FeatureName "Microsoft-Windows-Subsystem-Linux"
        if ($WSL.State -eq "Enabled") {
            return $true
        } 
        else {
            return $false
        }
    }   

    # HyperV
    if ($ToggleSwitch -eq "HyperVVirtualization") {

        $HyperV = Get-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V"

        if ($HyperV.State -eq "Enabled") {
            return $true
        } 
        else {
            return $false
        }
    }
}
function Install-App {
    
    <#
        .SYNOPSIS
        Installs an application using either Chocolatey or Winget package managers.
    #>

    param ([string]$Source, [string]$Name,[string]$Choco,[string]$Scoop,[string]$Winget,[string]$ITT)
    
    # Arguments
    $wingetArgs = "install --id $Winget --silent --accept-source-agreements --accept-package-agreements --force"
    $chocoArgs = "install $Choco --confirm --acceptlicense -q --ignore-http-cache --limit-output --allowemptychecksumsecure --ignorechecksum --allowemptychecksum --usepackagecodes --ignoredetectedreboot --ignore-checksums --ignore-reboot-requests"
    $ittArgs = "install $ITT -y"
    $scoopArgs = "$Scoop"

    # Helper function to install an app using a specific installer
    function Install-AppWithInstaller {
        param ([string]$Installer,[string]$InstallArgs)

        # Try to install and return the exit code
        $process = Start-Process -FilePath $Installer -ArgumentList $InstallArgs -NoNewWindow -Wait -PassThru
        return $process.ExitCode
    }

    # Function to log installation result
    function Log {

        param ([string]$Installer,[string]$Source)

        if ($Installer -ne 0) {
            return @{ Success = $false; Message = "Installation Failed for ($Name). Report the issue in ITT repository." }
        }
        else {
            return @{ Success = $true; Message = "Successfully Installed ($Name)" }
        }
    }

     # If specific package manager is requested
    if ($Source -ne "auto") {

        switch ($Source.ToLower()) {
            "choco" { 
                
                if ($Choco -eq "na") {
                    Add-Log -Message "Chocolatey package not available for $Name" -Level "WARNING"
                    return @{ Success = $false; Message = "This app is not available in Chocolatey" }
                }

                Install-Dependencies -PKGMan "choco"

                $exitCode = Install-AppWithInstaller "choco" $chocoArgs

                return Log $exitCode "Chocolatey"
            }
            "winget" {

                if ($Winget -eq "na") {
                    Add-Log -Message "Winget package not available for $Name" -Level "WARNING"
                    return @{ Success = $false; Message = "This app is not available in Winget" }
                }

                Install-Dependencies -PKGMan "winget"

                $exitCode = Install-AppWithInstaller "winget" $wingetArgs

                return Log $exitCode "Winget"
            }
            "scoop" {

                if ($Scoop -eq "na") {
                    Add-Log -Message "Scoop package not available for $Name" -Level "WARNING"
                    return @{ Success = $false; Message = "This app is not available in Scoop" }
                }

                Install-Dependencies -PKGMan "scoop"

                $LASTEXITCODE = scoop install $scoopArgs

                return Log $LASTEXITCODE "Scoop"
            }
            default {
                Add-Log -Message "Invalid package manager specified: $Source" -Level "ERROR"
                return @{ Success = $false; Message = "Invalid package manager" }
            }
        }
    }

    # TODO: if all package managers are 'none', use itt
    if ($Choco -eq "na" -and $Winget -eq "na" -and $itt -ne "na") {

        Install-Dependencies -PKGMan "itt"
        Add-Log -Message "Attempting to install $Name." -Level "ITT"
        $ITTResult = Install-AppWithInstaller "itt" $ittArgs
        Log $ITTResult "itt"
    }
    else 
    {
        # TODO: if choco is 'none' and Scoop is equal to 'none' and winget is NOT 'none', use winget
        # Skip choco and scoop
        if ($Choco -eq "na" -and $Scoop -eq "na" -and $Winget -ne "na") 
        {
            Add-Log -Message "Attempting to install $Name." -Level "Winget"

            Install-Winget
            
            Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
            
            $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
            Log $wingetResult "Winget"
        }
        else 
        {
            # TODO: If choco is not equal to 'none' and winget is not equal to 'none', use choco first and fallback to scoop and if scoop is failed, use winget for last try
            if ($Choco -ne "na" -or $Winget -ne "na" -or $Scoop -ne "na") 
            {
                Add-Log -Message "Attempting to install $Name." -Level "Chocolatey"

                Install-Dependencies -PKGMan "choco"

                $chocoResult = Install-AppWithInstaller "choco" $chocoArgs

                if ($chocoResult -ne 0) {

                    Add-Log -Message "installation failed, Falling back to winget." -Level "info"

                    Install-Dependencies -PKGMan "winget"

                    $wingetResult = Install-AppWithInstaller "winget" $wingetArgs

                    if ($wingetResult -ne 0) {

                        Add-Log -Message "installation failed, Falling back to scoop." -Level "info"

                        Install-Dependencies -PKGMan "scoop"

                        scoop install $scoopArgs

                        Log $LASTEXITCODE "Scoop"
                        
                    }else {
                        Log $wingetResult "Winget"
                    }
                }
                else 
                {
                    Log $chocoResult "Chocolatey"
                }
            }
            else 
            {
                Add-Log -Message "$Name is not available in any package manager" -Level "info"
            }
        }
    }
}
function Install-Dependencies {

    param ([string]$PKGMan)

    switch ($PKGMan)
    {
        "itt" {

            # Installing ITT Package manager if not exist
            if (-not (Get-Command itt -ErrorAction SilentlyContinue))
            {
                Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/itt-co/bin/refs/heads/main/install.ps1')) *> $null
            }
            else
            {
                try {
                    # Check for updates
                    $currentVersion = (itt.exe -ver)
                    $installerPath = "$env:TEMP\installer.msi"
                    $latestReleaseApi = "https://api.github.com/repos/itt-co/bin/releases/latest"
                    $latestVersion = (Invoke-RestMethod -Uri $latestReleaseApi).tag_name
                    if ($latestVersion -eq $currentVersion) {return}
                    # Write-Host "New version available: $latestVersion. Updating..."
                    Invoke-WebRequest "https://github.com/itt-co/bin/releases/latest/download/installer.msi" -OutFile $installerPath
                    Start-Process msiexec.exe -ArgumentList "/i `"$installerPath`" /q" -NoNewWindow -Wait
                    Write-Host "Updated to version $latestVersion successfully."
                    # Remove-Item -Path $installerPath -Force
                }
                catch {
                    Add-Log -Message "$_" -Level "error"
                }
            }
        }
        "choco" { 

            if (-not (Get-Command choco -ErrorAction SilentlyContinue))
            {
                Add-Log -Message "Installing dependencies..." -Level "INFO"
                Add-Log -Message "This might take few seconds" -Level "INFO"
                Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) *> $null
            }
        }
        "winget" { 

            if(Get-Command winget -ErrorAction SilentlyContinue) {return}

            $ComputerInfo = Get-ComputerInfo -ErrorAction Stop
            
            $arch = [int](($ComputerInfo).OsArchitecture -replace '\D', '')

            if ($ComputerInfo.WindowsVersion -lt "1809") {
                Add-Log -Message "Winget is not supported on this version of Windows Upgrade to 1809 or newer." -Level "info" 
                return
            }

            $VCLibs = "https://aka.ms/Microsoft.VCLibs.x$arch.14.00.Desktop.appx"
            $UIXaml = "https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x$arch.appx"
            $WingetLatset = "https://aka.ms/getwinget"

            try {
                
                Add-Log -Message "Installing Winget..." -Level "info"
                Add-Log -Message "This might take several minutes" -Level "info"
                Start-BitsTransfer -Source $VCLibs -Destination "$env:TEMP\Microsoft.VCLibs.Desktop.appx"
                Start-BitsTransfer -Source $UIXaml -Destination "$env:TEMP\Microsoft.UI.Xaml.appx"
                Start-BitsTransfer -Source $WingetLatset -Destination "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

                Add-AppxPackage "$env:TEMP\Microsoft.VCLibs.Desktop.appx"
                Add-AppxPackage "$env:TEMP\Microsoft.UI.Xaml.appx"
                Add-AppxPackage "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
                Start-Sleep -Seconds 1
                Add-Log -Message "Successfully installed Winget. Continuing to install selected apps..." -Level "info"
                return
            }
            catch {
                Write-Error "Failed to install $_"
            }
        }
        "scoop" {

            if (-not (Get-Command scoop -ErrorAction SilentlyContinue))
            {
                Add-Log -Message "Installing scoop..." -Level "info"
                Add-Log -Message "This might take few seconds" -Level "info"
                Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
                Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression
                scoop bucket add extras
            }
        }
    }
}
function Install-Winget {

    <#
        .SYNOPSIS
        Installs Winget on Windows systems that support it.

        .DESCRIPTION
        This function checks if Winget is installed on the system. If not, it verifies the system's architecture and Windows version to ensure compatibility. It 
        then downloads and installs the necessary dependencies and Winget itself.
    #>

    if(Get-Command winget -ErrorAction SilentlyContinue) {return}
    $ComputerInfo = Get-ComputerInfo -ErrorAction Stop
    $arch = [int](($ComputerInfo).OsArchitecture -replace '\D', '')

    if ($ComputerInfo.WindowsVersion -lt "1809") {
        Add-Log -Message "Winget is not supported on this version of Windows Upgrade to 1809 or newer." -Level "info" 
        return
    }

    $VCLibs = "https://aka.ms/Microsoft.VCLibs.x$arch.14.00.Desktop.appx"
    $UIXaml = "https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x$arch.appx"
    $WingetLatset = "https://aka.ms/getwinget"

    try {
        
        Add-Log -Message "Installing Winget... This might take several minutes" -Level "info"
        Start-BitsTransfer -Source $VCLibs -Destination "$env:TEMP\Microsoft.VCLibs.Desktop.appx"
        Start-BitsTransfer -Source $UIXaml -Destination "$env:TEMP\Microsoft.UI.Xaml.appx"
        Start-BitsTransfer -Source $WingetLatset -Destination "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

        Add-AppxPackage "$env:TEMP\Microsoft.VCLibs.Desktop.appx"
        Add-AppxPackage "$env:TEMP\Microsoft.UI.Xaml.appx"
        Add-AppxPackage "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
        Start-Sleep -Seconds 1
        Add-Log -Message "Successfully installed Winget. Continuing to install selected apps..." -Level "info"
        return
    }
    catch {
        Write-Error "Failed to install $_"
    }
}
function Refresh-Explorer {


    Add-Log -Message "Restart explorer." -Level "info"

    Stop-Process -processName: Explorer -Force

    Start-Sleep -Seconds 1

    # Check if explorer is not running and start it if needed
    if (-not (Get-Process -processName: Explorer)) {
        Start-Process explorer.exe
    }
}
function Remove-ScheduledTasks {

    param ([Parameter(Mandatory = $true)][array]$tweak)
    
    foreach ($task in $tweak) {
        Add-Log -Message "Removing $task ScheduledTask..." -Level "info"
        $tasks = Get-ScheduledTask -TaskName "*$task*" -ErrorAction SilentlyContinue
        if ($tasks) 
        {
            foreach ($task in $tasks) 
            {
                Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false
                Add-Log -Message "$($task.TaskName) Removed" -Level "INFO"
            }
        } 
        else
        {
            if ($Debug) 
            {
                Add-Log -Message "No tasks matching '$task' found" -Level "debug"
            }
        }
    }
}
# load file.itt
function Get-file {

    # Check if a process is running
    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }

    # Open file dialog to select JSON file
    $openFileDialog = New-Object Microsoft.Win32.OpenFileDialog -Property @{
        Filter = "itt files (*.itt)|*.itt"
        Title  = "itt File"
    }

    if ($openFileDialog.ShowDialog() -eq $true) {

        try {

            # Load and parse JSON data
            $FileContent = Get-Content -Path $openFileDialog.FileName -Raw | ConvertFrom-Json -ErrorAction Stop

            # Get the apps list and collection view
            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.AppsListView.Items)

            # Define the filter predicate
            $collectionView.Filter = {
                param($item)

                if ($FileContent.Name -contains $item.Content) { return $item.IsChecked = $true } else { return $false }
            }
        }
        catch {
            Write-Warning "Failed to load or parse JSON file: $_"
        }
    }
}

# Save selected items to a JSON file
function Save-File {

    $itt['window'].FindName("AppsCategory").SelectedIndex = 0
    
    $selectedApps = Get-SelectedItems -Mode "Apps"

    if ($selectedApps.Count -le 0) {return}

    # Collect checked items
    $items = foreach ($item in $itt.AppsListView.Items) {
        
        if ($item.IsChecked) {
            [PSCustomObject]@{
                Name  = $item.Content
            }
        }
    }

    # If no items are selected, show a message and return
    if ($items.Count -eq 0) {
        Message -key "Empty_save_msg" -icon "Information" -action "OK"
        return
    }

    # Open save file dialog
    $saveFileDialog = New-Object Microsoft.Win32.SaveFileDialog -Property @{
        Filter = "JSON files (*.itt)|*.itt"
        Title  = "Save JSON File"
    }

    if ($saveFileDialog.ShowDialog() -eq $true) {
        # Save items to JSON file
        $items | ConvertTo-Json -Compress | Out-File -FilePath $saveFileDialog.FileName -Force
        Write-Host "Saved: $($saveFileDialog.FileName)"
    }

    # Uncheck checkboxex if user Cancel 
    Show-Selected -ListView "AppsListView" -Mode "Default"
}

# Quick Install 
function Quick-Install {
    
    param (
        [string]$file
    )

    try {
        # Get file local or remote
        if ($file -match "^https?://") {

            $FileContent = Invoke-RestMethod -Uri $file -ErrorAction Stop

            if ($FileContent -isnot [array] -or $FileContent.Count -eq 0) {
                Message -NoneKey "The file is corrupt or access is forbidden" -icon "Warning" -action "OK"
                return
            }

        }
        else {

            $FileContent = Get-Content -Path $file -Raw | ConvertFrom-Json -ErrorAction Stop

            if ($file -notmatch "\.itt") {
                Message -NoneKey "Invalid file format. Expected .itt file." -icon "Warning" -action "OK"
                return
            }
        }

    }
    catch {
        Write-Warning "Failed to load or parse JSON file: $_"
        return
    }

    if ($null -eq $FileContent) { return }

    # Get the apps list and collection view
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['Window'].FindName('appslist').Items)

    # Set the filter predicate
    $collectionView.Filter = {
        param($item)

        if ($FileContent.Name -contains $item.Content) { return $item.IsChecked = $true } else { return $false }
    }

    # Start the installation process
    try {
        Invoke-Install *> $null
    }
    catch {
        Write-Warning "Installation failed: $_"
    }
}
function Set-Registry {

    <#
        .SYNOPSIS
        Sets or creates a registry value at a specified path.
        .DESCRIPTION
        This function sets a registry value at a given path. If the specified registry path does not exist, the function attempts to create the path and set the value.
        .EXAMPLE
        Set-Registry -Name "EnableFeeds" -Type "DWord" -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Value 0
        Sets the registry value named "EnableFeeds" to 0 (DWORD) under "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds". If the path does not exist, it attempts to create it.
    #>

    param ([array]$tweak)
    
    try {

        if(!(Test-Path 'HKU:\')) {New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS}

        $tweak | ForEach-Object {

            if($_.Value -ne "Remove")
            {
                If (!(Test-Path $_.Path)) {
                    Add-Log -Message "$($_.Path) was not found, Creating..." -Level "info"
                    New-Item -Path $_.Path -Force -ErrorAction Stop | Out-Null
                }

                Add-Log -Message "Optmize $($_.name)..." -Level "info"
                New-ItemProperty -Path $_.Path -Name $_.Name -PropertyType $_.Type -Value $_.Value -Force | Out-Null     

            }
            else
            {
                if($_.Name -ne $null)
                {
                    # Remove the specific registry value
                    Add-Log -Message "Remove $($_.name) from registry..." -Level "info"
                    Remove-ItemProperty -Path $_.Path -Name $_.Name -Force -ErrorAction SilentlyContinue
                }
                else
                {
                    # remove the registry path
                    Add-Log -Message "Remove $($_.Path)..." -Level "info"
                    Remove-Item -Path $_.Path -Recurse -Force -ErrorAction SilentlyContinue
                }
            }
        }
    } catch {
        Add-Log -Message "An error occurred: $_" -Level "WARNING"
    }
}
function Set-Taskbar {

    <#
        .SYNOPSIS
        Sets the taskbar progress and overlay icon in the application window.
        .DESCRIPTION
        The `Set-Taskbar` function allows setting the taskbar progress state, progress value, 
    #>

    param ([string]$progress,[double]$value,[string]$icon)


    try {

        if ($value) {
            $itt["window"].taskbarItemInfo.ProgressValue = $value
        }
        
        if($progress)
        {
            switch ($progress) {
                'None' { $itt["window"].taskbarItemInfo.ProgressState = "None" }
                'Normal' { $itt["window"].taskbarItemInfo.ProgressState = "Normal" }
                'Indeterminate' { $itt["window"].taskbarItemInfo.ProgressState = "Indeterminate" }
                'Error' { $itt["window"].taskbarItemInfo.ProgressState = "Error" }
                default { throw "Set-Taskbar Invalid state" }
            }
        }
        if($icon)
        {
            switch ($icon) {
                "done" {$itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/done.png"}
                "logo" {$itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico"}
                "error" {$itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/IT/main/static/Icons/error.png"}
                default{$itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/main//static/Icons/icon.ico"}
            }   
        }

    }
    catch {
        #Add-Log -Message "$_" -Level "info"
    }
}
function Startup {

    <#
    .SYNOPSIS
        Runs startup tasks including usage logging, music playback, and quote display.
    #>

    ITT-ScriptBlock -ArgumentList $Debug -ScriptBlock {
 
        param($Debug)
        
        function UsageCount {
            try {
                $Message = "👨‍💻 Build Ver: $($itt.lastupdate)`n🚀 URL: $($itt.command)`n👤 Username: $env:USERNAME`n🌐 Language: $($itt.Language)"
                $EncodedMessage = [uri]::EscapeDataString($Message)
                $Url = "https://itt.emadadel4.workers.dev/log?text=$EncodedMessage"
                $result = Invoke-RestMethod -Uri $Url -Method GET
                Add-Log -Message "`n  $result times worldwide`n"
            }
            catch {
                Add-Log -Message "Your internet connection appears to be slow." -Level "info"
            }
        }
        function PlayMusic {
            $tracks = (Invoke-RestMethod "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/ittplaylist.m3u") -split "`n" | Where-Object { $_ -and ($_ -notmatch "^#") }
            $shuffledTracks = $tracks | Get-Random -Count $tracks.Count
            foreach ($track in $shuffledTracks) {
                $mediaItem = $itt.mediaPlayer.newMedia($track)
                $itt.mediaPlayer.currentPlaylist.appendItem($mediaItem)
                $itt.mediaPlayer.controls.play()
                while ($itt.mediaPlayer.playState -in 3,6) {
                    Start-Sleep -Milliseconds 100
                }
            }
        }
        function Quotes {
            $q=(Invoke-RestMethod "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/Quotes.json").Quotes|Sort-Object {Get-Random}
            Set-Statusbar -Text "☕ $($itt.database.locales.Controls.$($itt.Language).welcome)"; Start-Sleep 18
            Set-Statusbar -Text "👁‍🗨 $($itt.database.locales.Controls.$($itt.Language).easter_egg)"; Start-Sleep 18
            $i=@{quote="💬";info="📢";music="🎵";Cautton="⚠";default="☕"}
            while(1){foreach($x in $q){$c=$i[$x.type];if(-not $c){$c=$i.default};$t="`“$($x.text)`”";if($x.name){$t+=" ― $($x.name)"};Set-Statusbar -Text "$c $t";Start-Sleep 25}}
        }
        function LOG {
            Write-Host "  `n` "
            Write-Host "  ███████████████████╗ Be the first to uncover the secret! Dive into"
            Write-Host "  ██╚══██╔══╚═══██╔══╝ the source code, find the feature and integrate it"
            Write-Host "  ██║  ██║ Emad ██║    https://github.com/emadadel4/itt"
            Write-Host "  ██║  ██║ Adel ██║    "
            Write-Host "  ██║  ██║      ██║    "
            Write-Host "  ╚═╝  ╚═╝      ╚═╝    "
            UsageCount
        }
        # debug start
        if ($Debug) { return }
        # debug end
        LOG
        PlayMusic
        Quotes
    }
}
function ChangeTap {

    <#
        .SYNOPSIS
        Updates the visibility of buttons and sets the current list based on the selected tab.
        .DESCRIPTION
        This function manages the visibility of buttons and the selection of lists based on which tab is currently selected in a user interface.
        .EXAMPLE
        ChangeTap
        Updates the visibility of the 'installBtn' and 'applyBtn' and sets the 'currentList' property based on the currently selected tab.
        .NOTES
        Ensure that the `$itt['window']` object and its method `FindName` are correctly implemented and available in the context where this function is used. The function relies on these objects to access and modify UI elements.
    #>

    $tabSettings = @{
            'apps'        = @{ 
            'installBtn' = 'Visible';
            'applyBtn' = 'Hidden'; 
            'CurrentList' = 'appslist'; 
            'CurrentCategory' = 'AppsCategory' 
        }
            'tweeksTab'   = @{ 
            'installBtn' = 'Hidden'; 
            'applyBtn' = 'Visible'; 
            'CurrentList' = 'tweakslist'; 
            'CurrentCategory' = 'TwaeksCategory'
        }
        'SettingsTab' = @{ 
            'installBtn' = 'Hidden'; 
            'applyBtn' = 'Hidden'; 
            'CurrentList' = 'SettingsList'
        }
    }
    # Iterate over the tab settings
    foreach ($tab in $tabSettings.Keys) {
        # Check if the current tab is selected
        if ($itt['window'].FindName($tab).IsSelected) {
            $settings = $tabSettings[$tab]
            # Update button visibility and currentList based on the selected tab
            $itt.CurrentList = $settings['CurrentList']
            $itt.CurrentCategory = $settings['CurrentCategory']
            $itt['window'].FindName('installBtn').Visibility = $settings['installBtn']
            $itt['window'].FindName('applyBtn').Visibility = $settings['applyBtn']
            $itt['window'].FindName('AppsCategory').Visibility = $settings['installBtn']
            $itt['window'].FindName('TwaeksCategory').Visibility = $settings['applyBtn']
            break
        }
    }
}
function Uninstall-AppxPackage {

    <#
        .SYNOPSIS
        Uninstalls an AppX package and removes any provisioned package references.
        .DESCRIPTION
        This function uninstalls a specified AppX package.
        .EXAMPLE
        Uninstall-AppxPackage -Name "Microsoft.BingNews"
    #>

    param ([array]$tweak)
    
    try {
        foreach ($name in $tweak) {
            Add-Log -Message "Removing $name..." -Level "info"
            Get-AppxPackage "*$name*" | Remove-AppxPackage -ErrorAction SilentlyContinue
            Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*$name*" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
        }
    } 
    catch 
    {
        Add-Log -Message "PLEASE USE (WINDOWS POWERSHELL) NOT (TERMINAL POWERSHELL 7) TO UNINSTALL $NAME." -Level "WARNING"
    }
}
function Invoke-Apply {

    <#
        .SYNOPSIS
        Handles the application of selected tweaks by executing the relevant commands, registry modifications, and other operations.
    #>

    $itt['window'].FindName("TwaeksCategory").SelectedIndex = 0
    $selectedTweaks = Get-SelectedItems -Mode "Tweaks"

    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }

    # Return if there is no selection
    if ($selectedTweaks.Count -le 0) {return}

    Show-Selected -ListView "TweaksListView" -Mode "Filter"

    $result = Message -key "Apply_msg" -icon "ask" -action "YesNo"

    if ($result -eq "no") {
        Show-Selected -ListView "TweaksListView" -Mode "Default"
        return
    }

    ITT-ScriptBlock -ArgumentList $selectedTweaks -debug $debug -ScriptBlock {

        param($selectedTweaks, $debug)

        $itt.ProcessRunning = $true

        if((Get-ItemProperty -Path $itt.registryPath -Name "backup" -ErrorAction Stop).backup -eq 0){
            UpdateUI -Button "ApplyBtn" -NonKey "Please Wait..." -Width "auto"
            Set-Statusbar -Text "ℹ Current task: Creating Restore Point..."
            CreateRestorePoint
        } 

        UpdateUI -Button "ApplyBtn" -Content "Applying" -Width "auto"

        $itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })

        foreach ($tweak in $selectedTweaks) {
            Add-Log -Message "::::$($tweak.Content)::::" -Level "default"
            ExecuteCommand -tweak $tweak.Script
        }

        $itt.ProcessRunning = $false
        Finish -ListView "TweaksListView"
    }
}
function Invoke-Install {
    
    <#
        .SYNOPSIS
        Handles the installation of selected applications by invoking the appropriate installation methods.
    #>

        
    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }
    
    # Get Selected apps
    $itt['window'].FindName("AppsCategory").SelectedIndex = 0
    $selectedApps = Get-SelectedItems -Mode "Apps"

    # Return if there is no selection
    if ($selectedApps.Count -le 0) {return}

    Show-Selected -ListView "AppsListView" -Mode "Filter"

    if (-not $i) {
        $result = Message -key "Install_msg" -icon "ask" -action "YesNo"
    }
    
    if ($result -eq "no") {
        Show-Selected -ListView "AppsListView" -Mode "Default"
        return
    }

    $itt.PackgeManager = (Get-ItemProperty -Path $itt.registryPath -Name "source" -ErrorAction Stop).source

    ITT-ScriptBlock -ArgumentList $selectedApps $i $source -Debug $debug -ScriptBlock {

        param($selectedApps , $i, $source)

        UpdateUI -Button "installBtn" -Content "Downloading" -Width "auto"

        $itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })

        $itt.ProcessRunning = $true

        foreach ($App in $selectedApps) {

            Write-Host $source

            Set-Statusbar -Text "ℹ Current task: Downloading $($App.Content)"

            # Some packages won't install until the package folder is removed.
            $chocoFolder = Join-Path $env:ProgramData "chocolatey\lib\$($App.Choco)"
            $ITTFolder = Join-Path $env:ProgramData "itt\downloads\$($App.ITT)"

            Remove-Item -Path "$chocoFolder" -Recurse -Force
            Remove-Item -Path "$chocoFolder.install" -Recurse -Force
            Remove-Item -Path "$env:TEMP\chocolatey" -Recurse -Force
            Remove-Item -Path "$ITTFolder" -Recurse -Force

            
            $Install_result = Install-App -Source $itt.PackgeManager -Name $App.Name -Choco $App.Choco -Scoop $App.Scoop -Winget $App.Winget -itt $App.ITT

            if ($Install_result.Success) {
                Set-Statusbar -Text "✔ $($Install_result.Message)"
                Add-Log -Message "$($Install_result.Message)" -Level "info"
            } else {
                Set-Statusbar -Text "✖ $($Install_result.Message)"
                Add-Log -Message "$($Install_result.Message)" -Level "ERROR"
            }
            
            # debug start
            if ($Debug) { Add-Log -Message "$($App.Choco) | $($App.Scoop) | $($App.Winget) | $($App.ITT)"  -Level "debug" }
            # debug end
        }

        Finish -ListView "AppsListView"
        $itt.ProcessRunning = $false
    }
}
function Invoke-Toggle {

    <#
        .SYNOPSIS
        Toggles various system settings based on the provided debug string input.
    #>
    
    Param ([string]$debug)

    Switch -Wildcard ($debug) {
        
        "showfileextensions" { Invoke-ShowFile-Extensions $(Get-ToggleStatus showfileextensions) }
        "darkmode" { Invoke-DarkMode $(Get-ToggleStatus darkmode) }
        "showsuperhidden" { Invoke-ShowFile $(Get-ToggleStatus showsuperhidden) }
        "numlook" { Invoke-NumLock $(Get-ToggleStatus numlook) }
        "stickykeys" { Invoke-StickyKeys $(Get-ToggleStatus stickykeys) }
        "mouseacceleration" { Invoke-MouseAcceleration $(Get-ToggleStatus mouseacceleration) }
        "endtaskontaskbarwindows11" { Invoke-TaskbarEnd $(Get-ToggleStatus endtaskontaskbarwindows11) }
        "clearpagefileatshutdown" { Invoke-ClearPageFile $(Get-ToggleStatus clearpagefileatshutdown) }
        "autoendtasks" { Invoke-AutoEndTasks $(Get-ToggleStatus autoendtasks) }
        "performanceoptions" { Invoke-PerformanceOptions $(Get-ToggleStatus performanceoptions) }
        "launchtothispc" { Invoke-LaunchTo $(Get-ToggleStatus launchtothispc) }
        "disableautomaticdriverinstallation" { Invoke-DisableAutoDrivers $(Get-ToggleStatus disableautomaticdriverinstallation) }
        "AlwaysshowiconsneverThumbnail" { Invoke-ShowFile-Icons $(Get-ToggleStatus AlwaysshowiconsneverThumbnail) }
        "CoreIsolationMemoryIntegrity" { Invoke-Core-Isolation $(Get-ToggleStatus CoreIsolationMemoryIntegrity) }
        "WindowsSandbox" { Invoke-WindowsSandbox $(Get-ToggleStatus WindowsSandbox) }
        "WindowsSubsystemforLinux" { Invoke-WindowsSandbox $(Get-ToggleStatus WindowsSubsystemforLinux) }
        "HyperVVirtualization" { Invoke-HyperV $(Get-ToggleStatus HyperVVirtualization) }
    }
    # debug start
    Add-Log -Message $debug -Level "debug"
    # debug end
}

function Invoke-AutoEndTasks {
    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.
        .PARAMETER Enabled
        A boolean value that determines whether file extensions should be shown (`$true`) or hidden (`$false`).
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $true
        This example makes file extensions visible in Windows Explorer.
        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $false
        This example hides file extensions in Windows Explorer.
        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
    Param(
        $Enabled,
        [string]$Path = "HKCU:\Control Panel\Desktop",
        [string]$name = "AutoEndTasks"
    )
        Try{
            if ($Enabled -eq $false){
                $value = 1
                Add-Log -Message "Enabled auto end tasks" -Level "info"
            }
            else {
                $value = 0
                Add-Log -Message "Disabled auto end tasks" -Level "info"
            }
        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}
function Invoke-LaunchTo {

    <#
        .SYNOPSIS
        Toggles the visibility of hidden files and folders in Windows Explorer.
    #>

    Param(
        $Enabled,
        [string]$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
        [string]$name = "LaunchTo"
    )
    
    Try{
        if ($Enabled -eq $false){
            $value = 1
            Add-Log -Message "Launch to This PC" -Level "info"
        }
        else {
            $value = 2
            Add-Log -Message "Launch to Quick Access" -Level "info"
        }

        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
        
        Refresh-Explorer
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-ClearPageFile {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>
    
    Param(
        $Enabled,
        [string]$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\\Memory Management",
        [string]$name = "ClearPageFileAtShutdown"
    )
    Try {
        if ($Enabled -eq $false) {
            $value = 1
            Add-Log -Message "Show End Task on taskbar" -Level "info"
        }
        else {
            $value = 0
            Add-Log -Message "Disable End Task on taskbar" -Level "info"
        }
        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch {
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-Core-Isolation {

    <#
        .SYNOPSIS
        Toggles the visibility of thmbnails in Windows Explorer.
    #>

    param ($Enabled, $Name = "Enabled", $Path = "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard")

    Try {
        if ($Enabled -eq $false) {
            $value = 1
            Add-Log -Message "This change require a restart" -Level "info"
        }
        else {
            $value = 0
            Add-Log -Message "This change require a restart" -Level "info"
        }
        Set-ItemProperty -Path $Path -Name $Name -Value $value -ErrorAction Stop
        Refresh-Explorer
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch {
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-DarkMode {

    <#
        .SYNOPSIS
        Toggles the Windows theme between Dark Mode and Light Mode based on the provided setting.
    #>

    Param($DarkMoveEnabled)
    Try{
        $Theme = (Get-ItemProperty -Path $itt.registryPath -Name "Theme").Theme
        if ($DarkMoveEnabled -eq $false){
            $DarkMoveValue = 0
            Add-Log -Message "Dark Mode" -Level "info"
            if($Theme -eq "default")
            {
                $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Dark"))
                $itt.Theme = "Dark"
            }
        }
        else {
            $DarkMoveValue = 1
            Add-Log -Message "Light Mode" -Level "info"
            if($Theme -eq "default")
            {
                $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Light"))
                $itt.Theme = "Light"
            }
        }
        $Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
        Set-ItemProperty -Path $Path -Name AppsUseLightTheme -Value $DarkMoveValue
        Set-ItemProperty -Path $Path -Name SystemUsesLightTheme -Value $DarkMoveValue
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-DisableAutoDrivers {
    
    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>

    Param(
        $Enabled,
        [string]$Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching",
        [string]$name = "SearchOrderConfig"
    )
        Try{
            if ($Enabled -eq $false){
                $value = 1
                Add-Log -Message "Enabled auto drivers update" -Level "info"
            }
            else {
                $value = 0
                Add-Log -Message "Disabled auto drivers update" -Level "info"
            }
        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}
function Invoke-HyperV {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>
    
    Param($Enabled)

    Try{
        if ($Enabled -eq $false){
            Add-Log -Message "Enabling HyperV..." -Level "info"
            Start-Process powershell -ArgumentList 'dism.exe /online /disable-feature /featurename:"Microsoft-Hyper-V-All" /norestart' -Verb RunAs
            Add-Log -Message "Restart required" -Level "info"
        }
        else {
            Add-Log -Message "Disabling HyperV..." -Level "info"
            Start-Process powershell -ArgumentList 'dism.exe /online /enable-feature /featurename:"Microsoft-Hyper-V-All" /all /norestart' -Verb RunAs
            Add-Log -Message "Restart required" -Level "info"
        }
    }

    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set HyperV due to a Security Exception"
    }
}
function Invoke-MouseAcceleration {
    
    <#
        .SYNOPSIS
        Toggles mouse acceleration settings on or off.
    #>
    
    param (
        $Mouse,
        $Speed = 0,
        $Threshold1  = 0,
        $Threshold2  = 0,
        [string]$Path = "HKCU:\Control Panel\Mouse"
    )
    try {
        if($Mouse -eq $false)
        {
            Add-Log -Message "Mouse Acceleration" -Level "info"
            $Speed = 1
            $Threshold1 = 6
            $Threshold2 = 10
        }else {
            $Speed = 0
            $Threshold1 = 0
            $Threshold2 = 0
            Add-Log -Message "Mouse Acceleration" -Level "info"
        }
        Set-ItemProperty -Path $Path -Name MouseSpeed -Value $Speed
        Set-ItemProperty -Path $Path -Name MouseThreshold1 -Value $Threshold1
        Set-ItemProperty -Path $Path -Name MouseThreshold2 -Value $Threshold2
    }
    catch {
        Add-Log -Message "Unable  set valuse" -LEVEL "ERROR"
    }
}
function Invoke-NumLock {

    <#
        .SYNOPSIS
        Toggles the Num Lock state on the system by modifying registry settings.
    #>
    
    param(
        [Parameter(Mandatory = $true)]
        [bool]$Enabled
    )
    try {
        if ($Enabled -eq $false)
        { 
            Add-Log -Message "Numlock Enabled" -Level "info"
            $value = 2 
        } 
        else
        { 
            Add-Log -Message "Numlock Disabled" -Level "info"
             $value = 0
        }
        New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS -ErrorAction Stop
        $Path = "HKU:\.Default\Control Panel\Keyboard"
        $Path2 = "HKCU:\Control Panel\Keyboard"
        Set-ItemProperty -Path $Path -Name InitialKeyboardIndicators -Value $value -ErrorAction Stop
        Set-ItemProperty -Path $Path2 -Name InitialKeyboardIndicators -Value $value -ErrorAction Stop
    }
    catch {
        Write-Warning "An error occurred: $($_.Exception.Message)"
    }
}
function Invoke-PerformanceOptions {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>

    Param(
        $Enabled,
        [string]$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects",
        [string]$name = "VisualFXSetting"
    )
        Try{
            if ($Enabled -eq $false){
                $value = 2
                Add-Log -Message "Enabled auto end tasks" -Level "info"
            }
            else {
                $value = 0
                Add-Log -Message "Disabled auto end tasks" -Level "info"
            }
        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
        Refresh-Explorer
        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}
function Invoke-ShowFile {

    <#
        .SYNOPSIS
        Toggles the visibility of hidden files and folders in Windows Explorer.
    #>
    
    Param($Enabled)
    Try {
        if ($Enabled -eq $false)
        { 
           $value = 1
           Add-Log -Message "Show hidden files , folders etc.." -Level "info"
        } 
        else 
        { 
            $value = 2
            Add-Log -Message "Don't Show hidden files , folders etc.." -Level "info"
        }
        $hiddenItemsKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        # Set registry values to show or hide hidden items
        Set-ItemProperty -Path $hiddenItemsKey -Name Hidden -Value $value
        Set-ItemProperty -Path $hiddenItemsKey -Name ShowSuperHidden -Value $value
        Refresh-Explorer
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set registry keys due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch {
        Write-Warning "Unable to set registry keys due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-ShowFile-Extensions {
    
    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>

    Param($Enabled)
    Try{
        if ($Enabled -eq $false){
            $value = 0
            Add-Log -Message "Hidden extensions" -Level "info"
        }
        else {
            $value = 1
            Add-Log -Message "Hidden extensions" -Level "info"
        }
        $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        Set-ItemProperty -Path $Path -Name HideFileExt -Value $value
        Refresh-Explorer
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-ShowFile-Icons {

    <#
        .SYNOPSIS
        Toggles the visibility of thmbnails in Windows Explorer.
    #>

    param ($Enabled, $Name = "IconsOnly", $Path = "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced")

    Try {
        if ($Enabled -eq $false) {
            $value = 1
            Add-Log -Message "ON" -Level "info"
        }
        else {
            $value = 0
            Add-Log -Message "OFF" -Level "info"
        }
        Set-ItemProperty -Path $Path -Name $Name -Value $value -ErrorAction Stop
        Refresh-Explorer
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch {
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-TaskbarEnd {
    
    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>

    Param($Enabled)
    Try{
        if ($Enabled -eq $false){
            $value = 1
            Add-Log -Message "Show End Task on taskbar" -Level "info"
        }
        else {
            $value = 0
            Add-Log -Message "Disable End Task on taskbar" -Level "info"
        }
        $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings\"
        $name = "TaskbarEndTask"
        if (-not (Test-Path $path)) {
            New-Item -Path $path -Force | Out-Null
            New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value $value -Force | Out-Null
        }else {
            Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
            Refresh-Explorer
            Add-Log -Message "This Setting require a restart" -Level "INFO"
        }
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
function Invoke-StickyKeys {

    <#
        .SYNOPSIS
        Toggles Sticky Keys functionality in Windows.
    #>
    
    Param($Enabled)
    Try {
        if ($Enabled -eq $false){
            $value = 510
            $value2 = 510
            Add-Log -Message "Sticky Keys" -Level "info"
        }
        else {
            $value = 58
            $value2 = 122
            Add-Log -Message "Sticky Keys" -Level "info"
        }
        $Path = "HKCU:\Control Panel\Accessibility\StickyKeys"
        $Path2 = "HKCU:\Control Panel\Accessibility\Keyboard Response"
        Set-ItemProperty -Path $Path -Name Flags -Value $value
        Set-ItemProperty -Path $Path2 -Name Flags -Value $value2
        Refresh-Explorer
        Add-Log -Message "This Setting require a restart" -Level "INFO"
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
    }
}
function Invoke-WindowsSandbox {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>

    Param($Enabled)

    Try{
        
        if ($Enabled -eq $false){

            Add-Log -Message "Enabling Windows Sandbox..." -Level "info"
            Start-Process powershell -ArgumentList 'Dism /online /Enable-Feature /FeatureName:"Containers-DisposableClientVM" -All /NoRestart' -Verb RunAs
            Add-Log -Message "Restart required" -Level "info"
        }
        else {
            Add-Log -Message "Disabling Windows Sandbox..." -Level "info"
            Start-Process powershell -ArgumentList 'Dism /online /Disable-Feature /FeatureName:"Containers-DisposableClientVM"  /NoRestart' -Verb RunAs
            Add-Log -Message "Restart required" -Level "info"
        }
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set Windows Sandbox due to a Security Exception"
    }
}
function Invoke-WSL {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>
    
    Param($Enabled)

    Try{
        if ($Enabled -eq $false){
            Add-Log -Message "Enabling WSL2..." -Level "info"
            Start-Process powershell -ArgumentList 'dism.exe /online /enable-feature /featurename:"Microsoft-Windows-Subsystem-Linux" /all /norestart' -Verb RunAs
            Start-Process powershell -ArgumentList 'dism.exe /online /enable-feature /featurename:"VirtualMachinePlatform" /all /norestart' -Verb RunAs
            Read-Host "Press ENTER to exit..."
            Add-Log -Message "Restart required" -Level "info"
        }
        else {
            Add-Log -Message "Disabling WSL2..." -Level "info"
            Start-Process powershell -ArgumentList 'dism.exe /online /disable-feature /featurename:"Microsoft-Windows-Subsystem-Linux" /norestart' -Verb RunAs
            Start-Process powershell -ArgumentList 'dism.exe /online /disable-feature /featurename:"VirtualMachinePlatform" /norestart' -Verb RunAs
            Read-Host "Press ENTER to exit..."
            Add-Log -Message "Restart required" -Level "info"
        }
    }

    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set WSL2 due to a Security Exception"
    }
}
function About {
    $aboutPopup = $itt['window'].FindName('AboutPopup')
    $aboutPopup.FindName('ver').Text = "Last update $($itt.lastupdate)"
    $aboutPopup.IsOpen = $true
}
function ITTShortcut {

    <#
        .SYNOPSIS
        Creates a desktop shortcut.
    #>

    # URL of the icon file
    # Determine the path in AppData\Roaming
    $appDataPath = "$env:ProgramData/itt"
    $localIconPath = Join-Path -Path $appDataPath -ChildPath "icon.ico"
    # Download the icon file
    Invoke-WebRequest -Uri $itt.icon -OutFile $localIconPath
    # Create a shortcut object
    $Shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut("$([Environment]::GetFolderPath('Desktop'))\ITT Emad Adel.lnk")
    # Set the target path to PowerShell with your command
    $Shortcut.TargetPath = "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe"
    $Shortcut.Arguments = "-ExecutionPolicy Bypass -NoProfile -Command ""irm raw.githubusercontent.com/emadadel4/ITT/main/itt.ps1 | iex"""
    # Set the icon path to the downloaded icon file in AppData\Roaming
    $Shortcut.IconLocation = "$localIconPath"
    # Save the shortcut
    $Shortcut.Save()
}
function Find-Driver {
   
    $gpuInfo = Get-CimInstance Win32_VideoController | Where-Object { $_.Status -eq "OK" } | Select-Object -First 1 -ExpandProperty Name
    $encodedName = [System.Web.HttpUtility]::UrlEncode($gpuInfo) -replace '\+', '%20'

    if (-not $gpuInfo) {
        Write-Host "No GPU detected"
    }


    if ($gpuInfo -match "NVIDIA") {
        Start-Process "https://www.nvidia.com/en-us/drivers/"
    }
    elseif ($gpuInfo -match "AMD" -or $gpuInfo -match "Radeon") {
        Start-Process "https://www.amd.com/en/support/download/drivers.html"
    }
    elseif ($gpuInfo -match "Intel") {
        Start-Process "https://www.intel.com/content/www/us/en/search.html?ws=idsa-suggested#q=$encodedName&sort=relevancy&f:@tabfilter=[Downloads]"
    }
    
}
function Search {

    <#
        .SYNOPSIS
        Filters items in the current list view based on the search input.
    #>

    $filter = $itt.searchInput.Text.ToLower() -replace '[^\p{L}\p{N}]', ''
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.currentList).Items)

    $collectionView.Filter = {
        param ($item)

        # Search within first-level child content
        return $item.Content -match $filter -or $item.category -match $filter
    }
}
function FilterByCat {

    param ($Cat)

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.CurrentList).Items)

    if ($Cat -eq "All" -or [string]::IsNullOrWhiteSpace($Cat)) {

        $collectionView.Filter = $null
    }
    else {
        $collectionView.Filter = {
            param ($item)

            $tags = $item.category

            return $tags -ieq $Cat
        }
    }

    $collectionView.Refresh()
}
$KeyEvents = {

    if ($itt.ProcessRunning) { 
        Set-Statusbar -Text "📢 Shortcut is disabled while process is running" 
        return 
    }

    $modifiers = $_.KeyboardDevice.Modifiers
    $key = $_.Key

    switch ($key) {
        "Enter" {
            if ($itt.currentList -eq "appslist") { Invoke-Install }
            elseif ($itt.currentList -eq "tweakslist") { Invoke-Apply }
        }
        "S" {
            if ($modifiers -eq "Ctrl") {
                if ($itt.currentList -eq "appslist") { Invoke-Install }
                elseif ($itt.currentList -eq "tweakslist") { Invoke-Apply }
            }
            elseif ($modifiers -eq "Shift") { Save-File }
        }
        "D" { if ($modifiers -eq "Shift") { Get-file } }
        "M" {
            if ($modifiers -eq "Shift") {
                $itt.Music = if ($itt.Music -eq 0) { 100 } else { 0 }
                Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value $itt.Music
                Manage-Music -action "SetVolume" -volume $itt.Music
            }
        }
        # Easter Egg: Uncomment to enable functionality
        # "N" { if ($modifiers -eq "Ctrl") { $itt.mediaPlayer.controls.next() } }
        # "B" { if ($modifiers -eq "Ctrl") { $itt.mediaPlayer.controls.previous() } }
        "Q" {
            if ($modifiers -eq "Ctrl") {
                $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "apps" }
            }
            elseif ($modifiers -eq "Shift") { RestorePoint }
        }
        "W" { if ($modifiers -eq "Ctrl") { $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "tweeksTab" } } }
        "E" { if ($modifiers -eq "Ctrl") { $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "SettingsTab" } } }
        "I" {
            if ($modifiers -eq "Ctrl") { About }
            elseif ($modifiers -eq "Shift") { ITTShortcut }
        }
        "C" { if ($modifiers -eq "Shift") { Start-Process explorer.exe $env:ProgramData\chocolatey\lib } }
        "T" { if ($modifiers -eq "Shift") { Start-Process explorer.exe $env:ProgramData\itt } }
        "G" { if ($modifiers -eq "Ctrl") { $this.Close() } }
        "F" {
            if ($modifiers -eq "Ctrl") {
                if ($itt.SearchInput.IsFocused) {
                    $itt.SearchInput.MoveFocus((New-Object System.Windows.Input.TraversalRequest([System.Windows.Input.FocusNavigationDirection]::Next)))
                } else {
                    $itt.SearchInput.Focus()
                }
            }
        }
        "A" {
            if ($modifiers -eq "Ctrl" -and ($itt.CurrentCategory -eq "AppsCategory" -or $itt.CurrentCategory -eq "TwaeksCategory")) {
                $itt["window"].FindName($itt.CurrentCategory).SelectedIndex = 0
            }
        }
    }
}
function Message {
    
    <#
        .SYNOPSIS
            Displays a localized message box to the user with a specified icon.
        .EXAMPLE
        Message -key "Welcome" -icon "Warning"
        .EXAMPLE 2
        Message -NoneKey "This normal text not based on locales" -icon "Warning"

    #>
    
    param([string]$key,[string]$NoneKey,[string]$title = "ITT",[string]$icon,[string]$action)

    $iconMap = @{ info = "Information"; ask = "Question"; warning = "Warning"; default = "Question" }
    $actionMap = @{ YesNo = "YesNo"; OK = "OK"; default = "OK" }
    $icon = if ($iconMap.ContainsKey($icon.ToLower())) { $iconMap[$icon.ToLower()] } else { $iconMap.default }
    $action = if ($actionMap.ContainsKey($action.ToLower())) { $actionMap[$action.ToLower()] } else { $actionMap.default }
    $msg = if ([string]::IsNullOrWhiteSpace($key)) { $NoneKey } else { $itt.database.locales.Controls.$($itt.Language).$key }
    [System.Windows.MessageBox]::Show($msg, $title, [System.Windows.MessageBoxButton]::$action, [System.Windows.MessageBoxImage]::$icon)
}
function Notify {

    <#
        .SYNOPSIS
        Displays a balloon tip notification in the system tray with a customizable title, message, icon, and duration.
        .EXAMPLE
        Notify -title "ITT" -msg "Hello world!" -icon "Information" -time 3000
        Displays a notification balloon with the title "ITT" and the message "Hello world!" with an informational icon for 3 seconds.
    #>
    
    param(
        [string]$title,
        [string]$msg,
        [string]$icon,
        [Int32]$time
    )
    $notification = New-Object System.Windows.Forms.NotifyIcon
    $notification.Icon = [System.Drawing.SystemIcons]::Information
    $notification.BalloonTipIcon = $icon
    $notification.BalloonTipText = $msg
    $notification.BalloonTipTitle = $title
    $notification.Visible = $true
    $notification.ShowBalloonTip($time)
    # Clean up resources
    $notification.Dispose()
}
function Manage-Music {

    <#
        .SYNOPSIS
        Manages music playback, volume
    #>

    param([string]$action, [int]$volume = 0)

    switch ($action) {
        "SetVolume" {
            $itt.mediaPlayer.settings.volume = $volume
            $global:toggleState = ($volume -ne 0)
            Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value "$volume" -Force
            $itt["window"].title = "Install Tweaks Tool " + @("🔊", "🔈")[$volume -eq 0]
        }
        "StopAll" {
            $itt.mediaPlayer.controls.stop() 
            $itt.mediaPlayer = $null
            $itt.runspace.Dispose()
            $itt.runspace.Close()
            $script:powershell.Dispose()
            $script:powershell.Stop()
            [System.GC]::Collect()
            [System.GC]::WaitForPendingFinalizers()
        }
        default { Write-Host "Invalid action. Use 'SetVolume' or 'StopAll'." }
    }
}
function System-Default {

    try {

        $dc = $itt.database.locales.Controls.$shortCulture

        if (-not $dc -or [string]::IsNullOrWhiteSpace($dc)) {
            Set-Statusbar -Text "Your default system language is not supported yet, fallback to English"
            $dc = $itt.database.locales.Controls.en
        }
        
        $itt["window"].DataContext = $dc

        Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -Force
    }
    catch {
        Write-Host "An error occurred: $_"
    }
}

function Set-Language {
    param ([string]$lang)
    if ($lang -eq "default") { System-Default }
    else {
        $itt.Language = $lang
        $itt["window"].DataContext = $itt.database.locales.Controls.$($itt.Language)
        Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value $lang -Force
    }
}

function SwitchToSystem {

    <#
        .SYNOPSIS
        Functions to manage application theme settings.

        .DESCRIPTION
        SwitchToSystem resets the theme to the system default and applies the appropriate resource.
        Set-Theme applies a user-defined theme and updates the registry accordingly.
    #>

    try {
        $appsTheme = Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme"
        $theme = if ($AppsTheme -eq "0") { "Dark" } elseif ($AppsTheme -eq "1") { "Light" } else { Write-Host "Unknown theme: $AppsTheme"; return }
        $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource($theme))
        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
        $itt.Theme = $Theme
    }
    catch { Write-Host "Error: $_" }
}

function Set-Theme {
    param ([string]$Theme)
    try {
        $itt['window'].Resources.MergedDictionaries.Clear()
        $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource($Theme))
        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value $Theme -Force
        $itt.Theme = $Theme
    }
    catch { Write-Host "Error: $_" }
}
function Set-Statusbar {
    
    <#
        .SYNOPSIS
        Set Statusbar text
    #>

    param ([string]$Text)
    $itt.Statusbar.Dispatcher.Invoke([Action]{$itt.Statusbar.Text = $Text })
}
function UpdateUI {
    
    <#
        .SYNOPSIS
        Update button's content width, text.
    #>

    param([string]$Button,[string]$Content,[string]$NonKey,[string]$Width = "140")

    $itt['window'].Dispatcher.Invoke([Action]{
        $itt.$Button.Width = $Width

        if($Content)
        {
            $itt.$Button.Content = $itt.database.locales.Controls.$($itt.Language).$Content
        }else{
            $itt.$Button.Content = $NonKey
        }
    })
}
#===========================================================================
#endregion End Main Functions
#===========================================================================
#===========================================================================
#region Begin WPF Main Window
#===========================================================================
function Show-Event {

    $itt['window'].FindName('DisablePopup').add_MouseLeftButtonDown({
        Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 1 -Force
        $popup.IsOpen = $false
    })

    
        $itt['window'].FindName('title').text = 'Changelog'.Trim()
        $itt['window'].FindName('date').text = '08/08/2025'.Trim()
        
    
            $itt['window'].FindName('ps').add_MouseLeftButtonDown({
                    Start-Process('https://www.palestinercs.org/en/Donation')
                })
            
            

    $storedDate = [datetime]::ParseExact($itt['window'].FindName('date').Text, 'MM/dd/yyyy', $null)
    $daysElapsed = (Get-Date) - $storedDate

    if (($daysElapsed.Days -ge 1) -and (($itt.PopupWindow -ne "0") -or $i)) { return }

    if ($daysElapsed.Days -lt 1) {
        $itt['window'].FindName('DisablePopup').Visibility = 'Hidden'
    }

    $popup.IsOpen = $true
}
$MainWindowXaml = @"
<!--Main Window-->
<Window
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
x:Name="Window" 
Title="Install Tweaks Tool" 
WindowStartupLocation = "CenterScreen" 
Background="{DynamicResource PrimaryBackgroundColor}"
Width="950"
Height="700"
MinHeight="600"
MinWidth="800"
FontFamily="Arial"
ShowInTaskbar = "True" 
TextOptions.TextFormattingMode="Ideal"
TextOptions.TextRenderingMode="Auto"
Icon="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico">
<Window.Resources>
    <!--Listview Fade in-->
    <Storyboard x:Key="FadeOutStoryboard">
        <DoubleAnimation
            Storyboard.TargetProperty="Opacity"
            From="0" To="1" Duration="0:0:0.2" />
    </Storyboard>
<!--Listview Fade in-->

<!--Logo Fade in-->
    <Storyboard x:Key="Logo" RepeatBehavior="Forever">
        <!-- Fade Out -->
        <DoubleAnimation
            Storyboard.TargetProperty="Opacity"
            From="0.1" To="1.0"
            Duration="0:0:01" />
        <!-- Fade In -->
        <DoubleAnimation
            Storyboard.TargetProperty="Opacity"
            From="1.0" To="0.0"
            Duration="0:0:1"
            BeginTime="0:0:15" /> 
    </Storyboard>
<!--Logo Fade in-->

<!--Button Style-->
    <Style TargetType="Button">
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor2}"/>
        <Setter Property="BorderBrush" Value="Transparent"/>
        <Setter Property="Padding" Value="8"/>
        <Setter Property="FontSize" Value="14"/>
        <Setter Property="Template">
        <Setter.Value>
            <ControlTemplate TargetType="Button">
                    <Grid>
                        <Border Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" CornerRadius="25">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                    </Grid>
            </ControlTemplate>
            </Setter.Value>
        </Setter>
        <Style.Triggers>
            <Trigger Property="IsMouseOver" Value="True">
                <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                <Setter Property="Foreground" Value="White"/>
            </Trigger>
            <Trigger Property="IsPressed" Value="True">
                <Setter Property="Background" Value="{DynamicResource PressedButtonColor}"/>
            </Trigger>
        </Style.Triggers>
    </Style>
<!--End Button Style-->

<!--ListView Style-->
    <Style TargetType="ListView">
        <Setter Property="BorderBrush" Value="{x:Null}"/>
        <Setter Property="Background" Value="{x:Null}"/>
        <Setter Property="SelectionMode" Value="Single"/>
        <Setter Property="VirtualizingStackPanel.VirtualizationMode" Value="Recycling"/>
        <Setter Property="VirtualizingStackPanel.IsVirtualizing" Value="True"/>
        <Setter Property="VirtualizingStackPanel.IsContainerVirtualizable" Value="True"/>
        <Setter Property="ScrollViewer.CanContentScroll" Value="True"/>
        <Setter Property="SnapsToDevicePixels" Value="True"/>
    </Style>

    <Style TargetType="ListViewItem">
        <Setter Property="Margin" Value="0 5 0 0"/>
        <Setter Property="BorderThickness" Value="0.3"/>
        <Setter Property="BorderBrush" Value="DarkGray"/>
        <Setter Property="Padding" Value="0"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="ListViewItem">
                    <Border Name="bg" 
                            CornerRadius="4"
                            Padding="{TemplateBinding Padding}" 
                            BorderBrush="{TemplateBinding BorderBrush}" 
                            BorderThickness="{TemplateBinding BorderThickness}" 
                            Background="{TemplateBinding Background}">
                        <ContentPresenter HorizontalAlignment="Left" 
                                        VerticalAlignment="Center" 
                                        ContentSource="Content"/>
                    </Border>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
        <Style.Triggers>
            <Trigger Property="ItemsControl.AlternationIndex" Value="0">
                <Setter Property="Background" Value="{DynamicResource itemColor1}" />
                <Setter Property="BorderBrush" Value="DarkGray"/>
                <Setter Property="BorderThickness" Value="0.7"/>
            </Trigger>
            <Trigger Property="ItemsControl.AlternationIndex" Value="1">
                <Setter Property="Background" Value="{DynamicResource itemColor2}" />
                <Setter Property="BorderBrush" Value="DarkGray"/>
                <Setter Property="BorderThickness" Value="0.7"/>
            </Trigger>
            <EventTrigger RoutedEvent="FrameworkElement.Loaded">
                <BeginStoryboard Storyboard="{StaticResource FadeOutStoryboard}" />
            </EventTrigger>
        </Style.Triggers>
    </Style>
<!--End ListView Style-->

<!--CheckBox Style-->
    <Style TargetType="CheckBox">
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="Margin" Value="0"/>
        <Setter Property="Padding" Value="6"/>
        <Setter Property="Background" Value="{x:Null}"/>
        <Setter Property="BorderThickness" Value="0"/>
        <Setter Property="BorderBrush" Value="DarkGray"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="CheckBox">
                    <Grid Margin="4">
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="Auto"/>
                            <ColumnDefinition Width="*" />
                        </Grid.ColumnDefinitions>
                        
                        <!-- Check Radius -->
                        <Border Width="20" Height="20"
                                Grid.Column="0"
                                BorderBrush="{TemplateBinding BorderBrush}"
                                CornerRadius="5"
                                BorderThickness="{TemplateBinding BorderThickness}"
                                Background="{TemplateBinding Background}">
                            <Grid>

                                <!-- Check Icon -->
                                <TextBlock x:Name="CheckIcon" HorizontalAlignment="Center" VerticalAlignment="Center" FontSize="17" />

                                <!-- Check Mark -->
                                <Path x:Name="CheckMark"
                                    Margin="4"
                                    Stretch="Uniform"
                                    Stroke="White"
                                    StrokeThickness="2"
                                    Data="M 0 5 L 4 8 L 10 0"
                                    Visibility="Collapsed"
                                    HorizontalAlignment="Center"
                                    VerticalAlignment="Center"/>
                            </Grid>
                        </Border>

                        <!-- Content -->
                        <ContentPresenter Grid.Column="1" Margin="8 0 0 0" VerticalAlignment="Center"/>
                    </Grid>

                    <ControlTemplate.Triggers>
                        <Trigger Property="IsChecked" Value="True">
                            <Setter TargetName="CheckMark" Property="Visibility" Value="Visible"/>
                            <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                            <Setter TargetName="CheckIcon" Property="Visibility" Value="Hidden"/>
                        </Trigger>
                        <Trigger Property="IsMouseOver" Value="True">
                            <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                            <Setter TargetName="CheckMark" Property="Visibility" Value="Visible"/>
                            <Setter TargetName="CheckIcon" Property="Foreground" Value="{DynamicResource HighlightColor}"/>
                            <Setter Property="Foreground" Value="{DynamicResource HighlightColor}"/>
                            <Setter Property="Cursor" Value="Hand"/>
                        </Trigger>

                        <!-- Custom icon based on selected tab -->
                        <DataTrigger Binding="{Binding SelectedItem.Tag, ElementName=taps}" Value="apps">
                            <Setter TargetName="CheckIcon" Property="Text" Value="📦"/>
                        </DataTrigger>
                        <DataTrigger Binding="{Binding SelectedItem.Tag, ElementName=taps}" Value="tweaks">
                            <Setter TargetName="CheckIcon" Property="Text" Value="🛠"/>
                        </DataTrigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End CheckBox Style-->

<!--SearchBox Style-->
    <Style x:Key="SearchBox" TargetType="TextBox">
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="BorderThickness" Value="0"/>
        <Setter Property="Padding" Value="8"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="TextBox">
                    <Grid>

                        <Border Background="{TemplateBinding Background}"
                                BorderThickness="{TemplateBinding BorderThickness}"
                                CornerRadius="15">
                            <ScrollViewer x:Name="PART_ContentHost"
                                        Background="Transparent"/>
                        </Border>

                        <!-- TextBlock placeholder -->
                        <TextBlock x:Name="PlaceholderText"
                                Text="🔍 Ctrl+F"
                                Foreground="Gray"
                                Margin="12,0,0,0"
                                VerticalAlignment="Center"
                                IsHitTestVisible="False"/>
                    </Grid>

                    <!-- Triggers -->
                    <ControlTemplate.Triggers>
                        <Trigger Property="Text" Value="">
                            <Setter TargetName="PlaceholderText" Property="Visibility" Value="Visible"/>
                        </Trigger>
                        <Trigger Property="Text" Value="{x:Null}">
                            <Setter TargetName="PlaceholderText" Property="Visibility" Value="Visible"/>
                        </Trigger>
                        <Trigger Property="Text" Value=" ">
                            <Setter TargetName="PlaceholderText" Property="Visibility" Value="Visible"/>
                        </Trigger>
                        <Trigger Property="Text" Value="🔍 Ctrl+F">
                            <Setter TargetName="PlaceholderText" Property="Visibility" Value="Collapsed"/>
                        </Trigger>
                        <Trigger Property="IsKeyboardFocused" Value="True">
                            <Setter TargetName="PlaceholderText" Property="Visibility" Value="Collapsed"/>
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End SearchBox Style-->

<!--Label Style-->
  <Style TargetType="Label">
    <Setter Property="Background" Value="Transparent"/>
    <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
    <Setter Property="Padding" Value="7.5"/>
    <Setter Property="Template">
        <Setter.Value>
            <ControlTemplate TargetType="Label">
                <Border Padding="{TemplateBinding Padding}" Background="{TemplateBinding Background}"
                        BorderBrush="{TemplateBinding BorderBrush}"
                        BorderThickness="{TemplateBinding BorderThickness}"
                        CornerRadius="0">
                    <ContentPresenter HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}"
                                      VerticalAlignment="{TemplateBinding VerticalContentAlignment}"/>
                </Border>
            </ControlTemplate>
        </Setter.Value>
    </Setter>
  </Style>
<!--End Label Style-->

<!--TextBlock Style-->
    <Style TargetType="TextBlock">
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="TextOptions.TextFormattingMode" Value="Ideal" />
        <Setter Property="TextOptions.TextRenderingMode" Value="ClearType" />
    </Style>
<!--End TextBlock Style-->

<!-- Menu Style -->
    <Style TargetType="Menu">
        <Setter Property="Background" Value="#FFFFFF"/>
        <Setter Property="Foreground" Value="#000000"/>
        <Setter Property="Margin" Value="5"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="Menu">
                    <Border Background="{TemplateBinding Background}" 
                            BorderBrush="{TemplateBinding BorderBrush}" 
                            BorderThickness="0" 
                            CornerRadius="8">
                        <ItemsPresenter />
                    </Border>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
        <Style.Triggers>
            <EventTrigger RoutedEvent="FrameworkElement.Loaded">
                <!-- <BeginStoryboard Storyboard="{StaticResource FadeIn}" /> -->
            </EventTrigger>
        </Style.Triggers>
    </Style>
    <Style TargetType="MenuItem">
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="BorderBrush" Value="{DynamicResource BorderBrush}"/>
        <Setter Property="BorderThickness" Value="1"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="MenuItem">
                    <Border x:Name="Border"
                            BorderBrush="{TemplateBinding BorderBrush}"
                            BorderThickness="{TemplateBinding BorderThickness}"
                            Padding="8"
                            CornerRadius="0">
                        <Grid>
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition Width="Auto"/>
                                <ColumnDefinition Width="*"/>
                                <ColumnDefinition Width="Auto"/>
                            </Grid.ColumnDefinitions>
                            <!-- Icon -->
                            <ContentPresenter Grid.Column="0" 
                                              ContentSource="Icon"
                                              HorizontalAlignment="Left"
                                              VerticalAlignment="Center"
                                              Margin="0,0,4,0"/>
                            <!-- Text (MenuItem Header) -->
                            <TextBlock x:Name="TextBlock"
                                       Grid.Column="1"
                                       Text="{TemplateBinding Header}"
                                       Foreground="{TemplateBinding BorderThickness}"
                                       VerticalAlignment="Center"
                                       Margin="0"/>
                            <!-- Shortcut Key (InputGestureText) -->
                            <TextBlock x:Name="ShortcutText"
                                       Grid.Column="2"
                                       Text="{TemplateBinding InputGestureText}"
                                       Foreground="{DynamicResource TextColorSecondaryColor}"
                                       VerticalAlignment="Center"
                                       HorizontalAlignment="Right"
                                       Margin="5,0"/>
                            <!-- Arrow Down Indicator for Submenus -->
                            <Path x:Name="Arrow"
                                  Grid.Column="2"
                                  Data="M0,0 L4,4 L8,0 Z"
                                  Fill="{DynamicResource TextColorSecondaryColor}"
                                  HorizontalAlignment="Center"
                                  VerticalAlignment="Center"
                                  Visibility="Collapsed"
                                  Margin="4,0,0,0"/>
                            <!-- Popup for Submenu -->
                            <Popup Name="PART_Popup" 
                                   Placement="Right" 
                                   IsOpen="{Binding IsSubmenuOpen, RelativeSource={RelativeSource TemplatedParent}}"                                   
                                   AllowsTransparency="True" 
                                   Focusable="False"
                                   PopupAnimation="Fade">
                                <Border Background="{TemplateBinding Background}" 
                                        BorderBrush="{DynamicResource BorderBrush}"     
                                        BorderThickness="2"
                                        CornerRadius="0">
                                    <StackPanel IsItemsHost="True" 
                                                KeyboardNavigation.DirectionalNavigation="Continue"/>
                                </Border>
                            </Popup>
                        </Grid>
                    </Border>
                    <ControlTemplate.Triggers>
                        <Trigger Property="IsMouseOver" Value="True">
                            <Setter TargetName="Border" Property="Background" Value="Transparent"/>
                            <Setter TargetName="TextBlock" Property="Foreground" Value="{DynamicResource HighlightColor}"/>
                            <Setter TargetName="ShortcutText" Property="Foreground" Value="{DynamicResource HighlightColor}"/>
                            <Setter TargetName="Arrow" Property="Fill" Value="{DynamicResource HighlightColor}"/>
                        </Trigger>
                        <Trigger Property="HasItems" Value="True">
                            <Setter TargetName="Arrow" Property="Visibility" Value="Visible"/>
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!-- End Menu Style -->

<!--Scrollbar Thumbs-->
    <Style x:Key="ScrollThumbs" TargetType="{x:Type Thumb}">
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="{x:Type Thumb}">
                    <Grid x:Name="Grid">
                        <Rectangle HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Fill="Transparent" />
                        <Border x:Name="Rectangle1" CornerRadius="5" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Background="{TemplateBinding Background}" />
                    </Grid>
                    <ControlTemplate.Triggers>
                        <Trigger Property="Tag" Value="Horizontal">
                            <Setter TargetName="Rectangle1" Property="Width" Value="Auto" />
                            <Setter TargetName="Rectangle1" Property="Height" Value="7" />
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
    <Style x:Key="{x:Type ScrollBar}" TargetType="{x:Type ScrollBar}">
        <Setter Property="Stylus.IsFlicksEnabled" Value="false" />
        <Setter Property="Foreground" Value="{DynamicResource PrimaryButtonForeground}" />
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
        <Setter Property="Width" Value="8" />
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="{x:Type ScrollBar}">
                    <Grid x:Name="GridRoot" Width="8" Background="{TemplateBinding Background}">
                        <Grid.RowDefinitions>
                            <RowDefinition Height="0.00001*" />
                        </Grid.RowDefinitions>
                        <Track x:Name="PART_Track" Grid.Row="0" IsDirectionReversed="true" Focusable="false">
                            <Track.Thumb>
                                <Thumb x:Name="Thumb" Background="{TemplateBinding Foreground}" Style="{DynamicResource ScrollThumbs}" />
                            </Track.Thumb>
                            <Track.IncreaseRepeatButton>
                                <RepeatButton x:Name="PageUp" Command="ScrollBar.PageDownCommand" Opacity="0" Focusable="false" />
                            </Track.IncreaseRepeatButton>
                            <Track.DecreaseRepeatButton>
                                <RepeatButton x:Name="PageDown" Command="ScrollBar.PageUpCommand" Opacity="0" Focusable="false" />
                            </Track.DecreaseRepeatButton>
                        </Track>
                    </Grid>
                    <ControlTemplate.Triggers>
                        <Trigger SourceName="Thumb" Property="IsMouseOver" Value="true">
                            <Setter Value="{DynamicResource ButtonSelectBrush}" TargetName="Thumb" Property="Background" />
                        </Trigger>
                        <Trigger SourceName="Thumb" Property="IsDragging" Value="true">
                            <Setter Value="{DynamicResource DarkBrush}" TargetName="Thumb" Property="Background" />
                        </Trigger>
                        <Trigger Property="IsEnabled" Value="false">
                            <Setter TargetName="Thumb" Property="Visibility" Value="Collapsed" />
                        </Trigger>
                        <Trigger Property="Orientation" Value="Horizontal">
                            <Setter TargetName="GridRoot" Property="LayoutTransform">
                                <Setter.Value>
                                    <RotateTransform Angle="-90" />
                                </Setter.Value>
                            </Setter>
                            <Setter TargetName="PART_Track" Property="LayoutTransform">
                                <Setter.Value>
                                    <RotateTransform Angle="-90" />
                                </Setter.Value>
                            </Setter>
                            <Setter Property="Width" Value="Auto" />
                            <Setter Property="Height" Value="8" />
                            <Setter TargetName="Thumb" Property="Tag" Value="Horizontal" />
                            <Setter TargetName="PageDown" Property="Command" Value="ScrollBar.PageLeftCommand" />
                            <Setter TargetName="PageUp" Property="Command" Value="ScrollBar.PageRightCommand" />
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
    <Style TargetType="ScrollViewer">
        <Setter Property="CanContentScroll" Value="False"/>
        <Setter Property="IsDeferredScrollingEnabled" Value="False"/>
        <Setter Property="VerticalScrollBarVisibility" Value="Auto"/>
        <Setter Property="HorizontalScrollBarVisibility" Value="Hidden"/>
    </Style>
<!--End Scrollbar Thumbs-->

<!--TabControl Style-->
    <Style TargetType="TabControl">
        <Setter Property="TabStripPlacement" Value="Left"/>
        <Setter Property="Foreground" Value="{x:Null}"/>
        <Setter Property="Background" Value="{x:Null}"/>
        <Setter Property="BorderBrush" Value="{x:Null}"/>
    </Style>

    <Style TargetType="TabItem">
        <Setter Property="Background" Value="{x:Null}"/>
        <Setter Property="FontSize" Value="18"/>
        <Setter Property="BorderBrush" Value="{x:Null}"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="TabItem">
                <Border Name="Border" 
                            CornerRadius="6" 
                            BorderThickness="0" 
                            Height="auto"
                            Width="auto"
                            Padding="8"
                            BorderBrush="Transparent" 
                            Background="Transparent" 
                            Margin="5">
                        <ContentPresenter 
                            x:Name="ContentSite"
                            VerticalAlignment="Center"
                            HorizontalAlignment="Center"
                            ContentSource="Header"
                            />
                </Border>
                    <ControlTemplate.Triggers>
                        <Trigger Property="IsSelected" Value="True">
                            <Setter TargetName="Border" Property="Background" Value="{DynamicResource HighlightColor}" />
                            <Setter Property="Foreground" Value="White" />
                        </Trigger>
                        <Trigger Property="IsSelected" Value="False">
                            <Setter TargetName="Border" Property="Background" Value="Transparent" />
                            <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}" />
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End TabControl Style-->

<!--ComboBox Style-->
    <Style  TargetType="ComboBox">
        <Setter Property="Focusable" Value="True"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="BorderThickness" Value="0"/>
        <Setter Property="Margin" Value="5"/>
        <Setter Property="FontSize" Value="12"/>
        <Setter Property="Background" Value="Transparent"/>
        <Setter Property="HorizontalAlignment" Value="Left"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="ComboBox">
                    <Border Background="{TemplateBinding Background}"
                            BorderBrush="{TemplateBinding BorderBrush}"
                            BorderThickness="{TemplateBinding BorderThickness}">
                        <ItemsPresenter/>
                    </Border>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
        <Setter Property="ItemsPanel">
            <Setter.Value>
                <ItemsPanelTemplate>
                    <WrapPanel Orientation="Horizontal" HorizontalAlignment="Left"/>
                </ItemsPanelTemplate>
            </Setter.Value>
        </Setter>
    </Style>

    <Style TargetType="ComboBoxItem">
        <Setter Property="Margin" Value="2"/>
        <Setter Property="Padding" Value="5"/>
        <Setter Property="Background" Value="Transparent"/>
        <Setter Property="Cursor" Value="Hand"/>
        <Setter Property="HorizontalContentAlignment" Value="Left"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="ComboBoxItem">
                    <Border x:Name="Bd"
                            Background="{TemplateBinding Background}"
                            CornerRadius="3"
                            Padding="{TemplateBinding Padding}">
                        <StackPanel Orientation="Horizontal" HorizontalAlignment="Left">
                            <ContentPresenter
                                HorizontalAlignment="Left"
                                TextBlock.TextAlignment="Left"
                                RecognizesAccessKey="True"/>
                        </StackPanel>
                    </Border>
                    <ControlTemplate.Triggers>
                                <Trigger Property="IsSelected" Value="True">
                                    <Setter TargetName="Bd" Property="Background" Value="{DynamicResource HighlightColor}"/>
                                    <Setter Property="Foreground" Value="White"/>
                                </Trigger>
                                <Trigger Property="IsMouseOver" Value="True">
                                    <Setter TargetName="Bd" Property="Background" Value="{DynamicResource HighlightColor}"/>
                                    <Setter Property="Foreground" Value="White"/>
                                </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--ComboBox Style-->

<!--ToggleSwitchStyle Style-->
    <Style x:Key="ToggleSwitchStyle" TargetType="CheckBox">
    <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="CheckBox">
                    <Grid VerticalAlignment="Center">
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="Auto"/>
                            <ColumnDefinition Width="Auto"/>
                            <ColumnDefinition Width="Auto"/>
                        </Grid.ColumnDefinitions>

                        <!-- Label (Content) -->
                        <TextBlock Grid.Column="0"
                                Text="{TemplateBinding Content}"
                                VerticalAlignment="Center"
                                Margin="0,0,10,0"/>

                        <!-- Toggle Switch -->
                        <Grid Grid.Column="1" Width="40" Height="20">
                            <Border x:Name="Track"
                                    Background="{DynamicResource SecondaryPrimaryBackgroundColor}"
                                    BorderThickness="1.2"
                                    BorderBrush="{DynamicResource ToggleSwitchBorderBrush}"
                                    CornerRadius="10"/>
                            <Ellipse x:Name="Thumb"
                                    Width="10" Height="10"
                                    Fill="Black"
                                    HorizontalAlignment="Left"
                                    VerticalAlignment="Center"
                                    Margin="2,0,0,0"/>
                        </Grid>

                        <!-- State Text -->
                        <TextBlock Grid.Column="2"
                                VerticalAlignment="Center"
                                Margin="10,0,0,0">
                            <TextBlock.Style>
                                <Style TargetType="TextBlock">
                                    <Setter Property="Text" Value="Off"/>
                                    <Style.Triggers>
                                        <DataTrigger Binding="{Binding RelativeSource={RelativeSource TemplatedParent}, Path=IsChecked}" Value="True">
                                            <Setter Property="Text" Value="On"/>
                                        </DataTrigger>
                                    </Style.Triggers>
                                </Style>
                            </TextBlock.Style>
                        </TextBlock>
                    </Grid>

                    <ControlTemplate.Triggers>
                        <!-- Trigger for Checked State (On) -->
                        <Trigger Property="IsChecked" Value="True">
                            <Trigger.EnterActions>
                                <RemoveStoryboard BeginStoryboardName="ToggleSwitchLeft"/>
                                <BeginStoryboard x:Name="ToggleSwitchRight">
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Thumb"
                                                            Storyboard.TargetProperty="Margin"
                                                            To="22,0,0,0"
                                                            Duration="0:0:0.1" />
                                    </Storyboard>
                                </BeginStoryboard>
                            </Trigger.EnterActions>
                            <Setter TargetName="Thumb" Property="Fill" Value="{DynamicResource ToggleSwitchEnableColor}"/>
                            <Setter TargetName="Track" Property="Background" Value="{DynamicResource HighlightColor}"/>
                            <Setter TargetName="Track" Property="BorderBrush" Value="{x:Null}"/>
                        </Trigger>

                        <!-- Trigger for Unchecked State (Off) -->
                        <Trigger Property="IsChecked" Value="False">
                            <Trigger.EnterActions>
                                <RemoveStoryboard BeginStoryboardName="ToggleSwitchRight"/>
                                <BeginStoryboard x:Name="ToggleSwitchLeft">
                                    <Storyboard>
                                        <ThicknessAnimation Storyboard.TargetName="Thumb"
                                                            Storyboard.TargetProperty="Margin"
                                                            To="5,0,0,0"
                                                            Duration="0:0:0.1" />
                                    </Storyboard>
                                </BeginStoryboard>
                            </Trigger.EnterActions>
                            <Setter TargetName="Thumb" Property="Fill" Value="{DynamicResource ToggleSwitchDisableColor}"/>
                        </Trigger>

                        <!-- Mouse Over Effect -->
                        <Trigger Property="IsMouseOver" Value="True">
                            <Setter TargetName="Track" Property="Background" Value="{DynamicResource HighlightColor}"/>
                            <Setter TargetName="Track" Property="Opacity" Value="0.2" />
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End ToggleSwitchStyle Style-->

<!--Logo Style-->
    <Style TargetType="TextBlock" x:Key="logoText">
        <Setter Property="Foreground" Value="{DynamicResource logo}"/>
        <Setter Property="TextOptions.TextFormattingMode" Value="Ideal" />
        <Setter Property="FontFamily" Value="Arial"/>
        <Setter Property="FontWeight" Value="bold"/>
        <Setter Property="FontSize" Value="60"/>
        <Setter Property="TextAlignment" Value="Center"/>
        <Setter Property="TextOptions.TextRenderingMode" Value="ClearType" />
        <Style.Triggers>
            <EventTrigger RoutedEvent="FrameworkElement.Loaded">
                <BeginStoryboard Storyboard="{StaticResource Logo}" />
            </EventTrigger>
        </Style.Triggers>
    </Style>
<!--End Logo Style-->
    <!-- Generated from build dont play here -->
        <!-- {Dark} -->
<!-- by {emadadel4} -->
<ResourceDictionary x:Key="Dark">

    <!-- Backgrounds -->
    <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#22272e"/>
    <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#2d333b"/>

    <!-- Text -->
    <SolidColorBrush x:Key="TextColorPrimary" Color="#adbac7"/>
    <SolidColorBrush x:Key="TextColorSecondaryColor" Color="#cdd9e5"/>
    <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#768390"/>
    
    <!-- Buttons and Highlights -->
    <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#539bf5"/>
    <SolidColorBrush x:Key="PrimaryButtonHighlight" Color="#539bf5"/>
    <SolidColorBrush x:Key="ButtonBorderColor" Color="#539bf5"/>
    <SolidColorBrush x:Key="HighlightColor" Color="#218bff"/>

    <!-- Borders and Labels -->
    <SolidColorBrush x:Key="BorderBrush" Color="#444c56"/>
    <SolidColorBrush x:Key="Label" Color="#373e47"/>

    <!-- Toggle Switch -->
    <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#373e47"/>
    <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#22272e"/>
    <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
    <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#768390"/>
    <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#444c56"/>

    <!-- ListView -->
    <SolidColorBrush x:Key="itemColor1" Color="#2d333b"/>
    <SolidColorBrush x:Key="itemColor2" Color="#333942"/>

    <!-- Misc -->
    <SolidColorBrush x:Key="logo" Color="#539bf5"/>
    <ImageBrush x:Key="BackgroundImage" ImageSource="{x:Null}" Stretch="UniformToFill"/>
    <x:String x:Key="SubText">Install Tweaks Tool</x:String>

</ResourceDictionary>
<!-- {Dark Knight} -->
<!-- by {emadadel} -->
<ResourceDictionary x:Key="DarkKnight">
    <!-- Backgrounds -->
    <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#0a0a0a"/>
    <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#121212"/>

    <!-- Text -->
    <SolidColorBrush x:Key="TextColorPrimary" Color="#e6e6e6"/>
    <SolidColorBrush x:Key="TextColorSecondaryColor" Color="#cccccc"/>
    <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#999999"/>

    <!-- Buttons and Highlights -->
    <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#00b7ff"/>
    <SolidColorBrush x:Key="PrimaryButtonHighlight" Color="#00b7ff"/> 
    <SolidColorBrush x:Key="ButtonBorderColor" Color="#ff0000"/>
    <SolidColorBrush x:Key="HighlightColor" Color="#218bff"/>     

    <!-- Borders and Labels -->
    <SolidColorBrush x:Key="BorderBrush" Color="#1c1c1c"/>
    <SolidColorBrush x:Key="Label" Color="#2a2a2a"/>

    <!-- Toggle Switch -->
    <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#1a1a1a"/>
    <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#0f0f0f"/>
    <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/> 
    <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#666666"/>
    <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#444444"/>

    <!-- ListView -->
    <SolidColorBrush x:Key="itemColor1" Color="#141414"/>
    <SolidColorBrush x:Key="itemColor2" Color="#1c1c1c"/>

    <!-- Misc -->
    <SolidColorBrush x:Key="logo" Color="#00b7ff"/> 
    <ImageBrush x:Key="BackgroundImage" ImageSource="https://images.hdqwalls.com/wallpapers/the-batman-fan-made-4k-xx.jpg" Stretch="UniformToFill" Opacity="0.4" />
    <x:String x:Key="SubText">I am not a hero</x:String>
</ResourceDictionary>

<!-- {Light} -->
<!-- by {emadadel} -->
<ResourceDictionary x:Key="Light">
    <!-- Backgrounds -->
    <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#ffffff"/>
    <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#f6f8fa"/>

    <!-- Text -->
    <SolidColorBrush x:Key="TextColorPrimary" Color="#24292f"/>
    <SolidColorBrush x:Key="TextColorSecondaryColor" Color="#1f2328"/>
    <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#57606a"/>

    <!-- Buttons and Highlights -->
    <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#0969da"/>
    <SolidColorBrush x:Key="PrimaryButtonHighlight" Color="#ffffff"/>
    <SolidColorBrush x:Key="ButtonBorderColor" Color="#0969da"/>
    <SolidColorBrush x:Key="HighlightColor" Color="#218bff"/>

    <!-- Borders and Labels -->
    <SolidColorBrush x:Key="BorderBrush" Color="#d0d7de"/>
    <SolidColorBrush x:Key="Label" Color="#d8e0e7"/>

    <!-- Toggle Switch -->
    <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#d0d7de"/>
    <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#f6f8fa"/>
    <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
    <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#57606a"/>
    <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#d0d7de"/>

    <!-- ListView -->
    <SolidColorBrush x:Key="itemColor1" Color="#f6f8fa"/>
    <SolidColorBrush x:Key="itemColor2" Color="#ebf0f4"/>

    <!-- Misc -->
    <SolidColorBrush x:Key="logo" Color="#0969da"/>
    <ImageBrush x:Key="BackgroundImage" ImageSource="{x:Null}" Stretch="UniformToFill"/>
    <x:String x:Key="SubText">Install Tweaks Tool</x:String>
</ResourceDictionary>
<!-- {Palestine} -->
<!-- by {emadadel} -->
<ResourceDictionary x:Key="Palestine">
    <!-- Backgrounds -->
    <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="black"/>
    <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="black"/>

    <!-- Text -->
    <SolidColorBrush x:Key="TextColorPrimary" Color="#F5F5F5"/>
    <SolidColorBrush x:Key="TextColorSecondaryColor" Color="#CCCCCC"/>
    <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#888888"/>

    <!-- Buttons and Highlights -->
    <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#00D99D"/>
    <SolidColorBrush x:Key="PrimaryButtonHighlight" Color="#FFFFFF"/>
    <SolidColorBrush x:Key="ButtonBorderColor" Color="#007A3D"/>
    <SolidColorBrush x:Key="HighlightColor" Color="#00D96D"/>

    <!-- Borders and Labels -->
    <SolidColorBrush x:Key="BorderBrush" Color="black"/>
    <SolidColorBrush x:Key="Label" Color="#444444"/>

    <!-- Toggle Switch -->
    <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#202020"/>
    <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#2b2b2b"/>
    <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
    <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#555555"/>
    <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#777777"/>

    <!-- ListView -->
    <SolidColorBrush x:Key="itemColor1" Color="#000000"/>
    <SolidColorBrush x:Key="itemColor2" Color="#000002"/>

    <!-- Misc -->
    <SolidColorBrush x:Key="logo" Color="#00D96D"/>
    <ImageBrush x:Key="BackgroundImage" ImageSource="https://w.wallhaven.cc/full/we/wallhaven-wegrj6.jpg" Stretch="UniformToFill" Opacity="0.3"/>
    <x:String x:Key="SubText">#StandWithPalestine</x:String>
</ResourceDictionary>


<!-- Generated from build dont play here -->

</Window.Resources>

<Grid Background="{DynamicResource BackgroundImage}">

    <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="Auto"/>
    </Grid.RowDefinitions>
    <!--Header Section-->
        <Grid>
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="Auto"/>
                <ColumnDefinition Width="*"/>
            </Grid.ColumnDefinitions>
                 <!-- Begin Menu section-->
    <Menu Grid.Row="0" Grid.Column="0" Background="Transparent" BorderBrush="Transparent" HorizontalAlignment="Left" BorderThickness="0">
        <MenuItem Background="Transparent" BorderBrush="Transparent" BorderThickness="0"  IsEnabled="False" ToolTip="Emad Adel">
            <MenuItem.Icon>
                <Border Background="Transparent" CornerRadius="10" Height="89" Width="89">
                    <StackPanel Orientation="Vertical">
                        <TextBlock Text="itt" VerticalAlignment="Center"  TextAlignment="Center" HorizontalAlignment="Center" Style="{DynamicResource logoText}"/>
                        <TextBlock Text="{DynamicResource SubText}" TextAlignment="Center" HorizontalAlignment="Center" VerticalAlignment="Center" FontWeight="Normal" FontSize="9" Style="{DynamicResource logoText}" />
                    </StackPanel>
                </Border>
            </MenuItem.Icon>
        </MenuItem>

        <MenuItem Header="{Binding Management, TargetNullValue=Management}" VerticalAlignment="Center" HorizontalAlignment="Left" BorderBrush="Transparent">
            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>

            <MenuItem Name="sysinfo" Header="{Binding System_Info, TargetNullValue=System Info}" >
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
            <MenuItem Name="poweroption" Header="{Binding Power_Options, TargetNullValue=Power Options}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
            <MenuItem Name="deviceManager">
                <MenuItem.Header>
                    <Binding Path="Device_Manager" TargetNullValue="Device Manager" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            

            <MenuItem Name="services" Header="{Binding Services, TargetNullValue=Services}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="network" Header="{Binding Networks, TargetNullValue=Networks}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="appsfeatures" Header="{Binding Apps_features, TargetNullValue=Programs and Features}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="taskmgr" Header="{Binding Task_Manager, TargetNullValue=Task Manager}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            

            <MenuItem Name="diskmgmt" Header="{Binding Disk_Managment, TargetNullValue=Disk Management}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
            <MenuItem Name="msconfig" Header="{Binding Msconfig, TargetNullValue=System Configuration}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="ev" Header="{Binding Environment_Variables, TargetNullValue=Environment Variables}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text="&#xE81E;"/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="spp" Header="{Binding System_Protection, TargetNullValue=System Protection}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

        </MenuItem>

        <MenuItem Header="{Binding Preferences, TargetNullValue=Preferences}" VerticalAlignment="Center" HorizontalAlignment="Left" BorderBrush="Transparent">
            <MenuItem.Icon>
                 <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>

            <MenuItem Name="restorepoint" Header="{Binding Create_restore_point, TargetNullValue=Restore Point}" InputGestureText="Shift+Q">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
            <MenuItem Header="{Binding package_manager, TargetNullValue=Package Manager}" ToolTip="Select Package Manager">

                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>

                <MenuItem Name="auto" Header="{Binding auto, TargetNullValue=Auto}" ToolTip="Automatically install using the best available method" />
                <MenuItem Name="choco" Header="Choco" />
                <MenuItem Name="winget" Header="Winget"/>

            </MenuItem>

            <MenuItem Header="{Binding Portable_Downloads_Folder}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>

                <MenuItem Name="chocoloc" Header="Choco" InputGestureText="Shift+C">
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>
                </MenuItem>

                <MenuItem Name="itt" Header="ITT" InputGestureText="Shift+T">
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>
                </MenuItem>

            </MenuItem>

            <MenuItem Name="save" Header="{Binding Save, TargetNullValue=Save}" ToolTip="Save selected apps" InputGestureText="Shift+S">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            

            <MenuItem Name="load" Header="{Binding Restore, TargetNullValue=Restore}" ToolTip="Restore selected apps" InputGestureText="Shift+D">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
            <MenuItem Header="{Binding Theme}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
                <MenuItem Name="systheme" Header="{Binding Use_system_setting, TargetNullValue=System}" ToolTip="Use system theme if available" />
                <MenuItem Name="Dark" Header="Dark"/>
<MenuItem Name="DarkKnight" Header="Dark Knight"/>
<MenuItem Name="Light" Header="Light"/>
<MenuItem Name="Palestine" Header="Palestine"/>
            </MenuItem>
            

            <!-- Music section -->
            <MenuItem Header="{Binding Music, TargetNullValue=Music}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>

                <MenuItem Name="moff" Header="{Binding off, TargetNullValue=Off}" InputGestureText="Shift+M">
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>
                </MenuItem>

                <MenuItem Name="mon" Header="{Binding on, TargetNullValue=On}" InputGestureText="Shift+M">
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>
                </MenuItem>
                
            </MenuItem>
            <!-- Music section -->

            <MenuItem Header="{Binding Language, TargetNullValue=Language}">
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>

                    <MenuItem Name="systemlang" Header="{Binding Use_system_setting, TargetNullValue=System Language}">
                    </MenuItem>
                    <MenuItem Name="ar" Header="عربي"/>
<MenuItem Name="de" Header="Deutsch"/>
<MenuItem Name="en" Header="English"/>
<MenuItem Name="es" Header="Español"/>
<MenuItem Name="fr" Header="Français"/>
<MenuItem Name="hi" Header="अंग्रेज़ी"/>
<MenuItem Name="it" Header="Italiano"/>
<MenuItem Name="ko" Header="한국어"/>
<MenuItem Name="ru" Header="Русский"/>
<MenuItem Name="tr" Header="Türkçe"/>
<MenuItem Name="zh" Header="中文"/>
            </MenuItem>

            <MenuItem Name="ittshortcut" Header="{Binding Create_desktop_shortcut, TargetNullValue=Create Shortcut}" InputGestureText="Shift+I">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
        </MenuItem>

        <MenuItem Header="{Binding Third_party, TargetNullValue=Third Party}" VerticalAlignment="Center" HorizontalAlignment="Center" BorderBrush="Transparent">

            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>
            
            <MenuItem Name="finddriver" Header="Find GPU Driver" ToolTip="Find GPU Driver on official manufacturer website">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="mas" Header="Windows activation" ToolTip="Windows activation">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="winoffice" Header="Windows/Office ISO" ToolTip="Windows and Office Orginal ISO">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
            <MenuItem Name="idm" Header="IDM Trial Reset" ToolTip="Get rid of IDM Active message">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="shelltube" ToolTip="Download youtube video easily" Header="ShellTube">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="spotifydown" Header="Spotify Downloader" ToolTip="SpotifyDown allows you to download tracks, playlists and albums from Spotify instantly.">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Header="{Binding Browsers_extensions, TargetNullValue=Browsers Extensions}">

                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>

                    <MenuItem Name="uBlock" Header="uBlockOrigin"/>
                    <MenuItem Header="Youtube">
                    <MenuItem Name="Unhook" Header="Unhook Customize youtube"/>
                    <MenuItem Name="efy" Header="Enhancer for YouTube"/>
            
                </MenuItem>
                
            </MenuItem>

            <MenuItem Name="sordum" ToolTip="Collection of free utilities designed to enhance or control various aspects of the Windows operating system" Header="Sordum tools">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="techpowerup" Header="TechPowerUp" ToolTip="Collection of free TechPowerUp utilities.">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="majorgeeks" ToolTip="website that provides trusted, safe, and curated software downloads for Windows users. It focuses on high-quality tools." Header="Major Geeks">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="webtor" ToolTip="Web-based platform that allows users to stream torrent files directly in their browser without needing to download them." Header="Webtor">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="rapidos" ToolTip="RapidOS is a powerful modification for Windows 10 and 11 that significantly boosts performance." Header="RapidOS">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="asustool" ToolTip="Tool that manages the setup installation for the legacy Aura Sync, LiveDash, AiSuite3" Header="ASUS Setup Tool">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
        </MenuItem>

        <MenuItem Name="dev" Header="{Binding About, TargetNullValue=About}" VerticalAlignment="Center" HorizontalAlignment="Center" BorderBrush="Transparent">
            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>
        </MenuItem>

    </Menu>
<!--End Menu section-->
            <Grid Grid.Column="1" HorizontalAlignment="Right" Margin="0,0,20,0">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="Auto"/>
                    <ColumnDefinition Width="Auto"/>
            </Grid.ColumnDefinitions>
                
                <!--Begin Search -->
<Grid HorizontalAlignment="Left" Grid.Column="1" VerticalAlignment="Center">
    <TextBox Padding="8"
        Width="120"
        VerticalAlignment="Center"
        HorizontalAlignment="Left"
        Style="{StaticResource SearchBox}"
        Name="searchInput" />
</Grid>
<!--End Search-->
            </Grid>
        </Grid>
    <!--Header Section-->

        <!--TabControl-->
    <TabControl Name="taps" Grid.Row="1" >

            <TabItem Name="apps" Header="{Binding apps, TargetNullValue=Apps}" Tag="apps" BorderBrush="{x:Null}" >

            <TabItem.HeaderTemplate>
                    <DataTemplate>
                        <StackPanel Orientation="Vertical" >
                            <TextBlock Text="📦" FontSize="18" VerticalAlignment="Center" HorizontalAlignment="Center"/>
                            <TextBlock Text="{Binding}" FontSize="12" VerticalAlignment="Center" HorizontalAlignment="Center"/>
                        </StackPanel>
                    </DataTemplate>
            </TabItem.HeaderTemplate>

                <Grid>

                    <Grid.RowDefinitions>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="*"/>
                    </Grid.RowDefinitions>
                    
                        <!--AppsCategory-->
                            <ComboBox 
                                SelectedIndex="0" 
                                Name="AppsCategory" 
                                Grid.Row="0"
                                VirtualizingStackPanel.IsVirtualizing="True"
                                VirtualizingStackPanel.VirtualizationMode="Recycling"
                                VerticalAlignment="Center" 
                                HorizontalAlignment="Center" 
                                Width="auto">

                                <ComboBoxItem Tag="All">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🏷 "/>
                                        <Run Text="{Binding all, TargetNullValue=All}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Web Browsers">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🌐 "/>
                                        <Run Text="{Binding web browsers, TargetNullValue=Web Browsers}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Media">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🎬 "/>
                                        <Run Text="{Binding media, TargetNullValue=Media}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Media Tools">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🎚 "/>
                                        <Run Text="{Binding media tools, TargetNullValue=Media Tools}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Documents">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="📃 "/>
                                        <Run Text="{Binding documents, TargetNullValue=Documents}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Compression">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="📀 "/>
                                        <Run Text="{Binding compression, TargetNullValue=Compression}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Communication">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="📞 "/>
                                        <Run Text="{Binding communication, TargetNullValue=Communication}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="File Sharing">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="📁 "/>
                                        <Run Text="{Binding file sharing, TargetNullValue=File Sharing}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Imaging">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="📷 "/>
                                        <Run Text="{Binding imaging, TargetNullValue=Imaging}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Gaming">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🎮 "/>
                                        <Run Text="{Binding gaming, TargetNullValue=Gaming}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Utilities">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🔨 "/>
                                        <Run Text="{Binding utilities, TargetNullValue=Utilities}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Disk Tools">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="💽 "/>
                                        <Run Text="{Binding disk tools, TargetNullValue=Disk Tools}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Development">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="👩‍💻 "/>
                                        <Run Text="{Binding development, TargetNullValue=Development}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Security">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🛡 "/>
                                        <Run Text="{Binding security, TargetNullValue=Security}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Portable">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="💼 "/>
                                        <Run Text="{Binding portable, TargetNullValue=Portable}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Runtimes">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="📈 "/>
                                        <Run Text="{Binding runtimes, TargetNullValue=Runtimes}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                                <ComboBoxItem Tag="Drivers">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🔌 "/>
                                        <Run Text="{Binding drivers, TargetNullValue=Drivers}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                            </ComboBox>

                        <!--End AppsCategory-->

                    <ListView Name="appslist" AlternationCount="2" Grid.Row="1">
                        <ListView.ItemsPanel>
                            <ItemsPanelTemplate>
                                <VirtualizingStackPanel />
                            </ItemsPanelTemplate>
                        </ListView.ItemsPanel>
                        <ListView.ItemTemplate>
                            <DataTemplate>
                                <StackPanel Orientation="Vertical" Margin="15">
                                    <CheckBox IsChecked="{Binding IsChecked}" Content="{Binding Content}" FontSize="15"/>
                                    <TextBlock Margin="10" FontSize="14" Foreground="{DynamicResource TextColorSecondaryColor2}" Text="{Binding Description}" Width="666"/>
                                </StackPanel>
                            </DataTemplate>
                        </ListView.ItemTemplate>
                    </ListView>
                
                </Grid> 

            </TabItem>

            <TabItem x:Name="tweeksTab" Header="{Binding tweaks, TargetNullValue=Tweaks}" Tag="tweaks">

                <TabItem.HeaderTemplate>
                        <DataTemplate>
                            <StackPanel Orientation="Vertical">
                                <TextBlock Text="🛠" VerticalAlignment="Center" HorizontalAlignment="Center"  FontSize="18"/>
                                <TextBlock Text="{Binding}" FontSize="12" VerticalAlignment="Center" HorizontalAlignment="Center"  TextWrapping="Wrap" Margin="0,5,0,0"/>
                            </StackPanel>
                        </DataTemplate>
                </TabItem.HeaderTemplate>

                <Grid>

                    <Grid.RowDefinitions>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="*"/>
                    </Grid.RowDefinitions>

                    <!--TwaeksCategory-->
                        <ComboBox 
                            SelectedIndex="0" 
                            Name="TwaeksCategory" 
                            Grid.Row="0" 
                            IsReadOnly="True"
                            VirtualizingStackPanel.IsVirtualizing="True"
                            VirtualizingStackPanel.VirtualizationMode="Recycling"
                            VerticalAlignment="Center" 
                            HorizontalAlignment="Center" 
                            Visibility="Collapsed"
                            Width="auto">

                              <ComboBoxItem Tag="all">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🏷 "/>
                                        <Run Text="{Binding all, TargetNullValue=All}"/>
                                    </TextBlock>
                                </ComboBoxItem>
                                
                                
                              <ComboBoxItem Tag="Privacy">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🔒 "/>
                                        <Run Text="{Binding privacy, TargetNullValue=Privacy}"/>
                                    </TextBlock>
                                </ComboBoxItem>
                            

                              <ComboBoxItem Tag="Fixer">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🔧 "/>
                                        <Run Text="{Binding fixer, TargetNullValue=Fixer}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                              <ComboBoxItem Tag="Performance">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="⚡ "/>
                                        <Run Text="{Binding performance, TargetNullValue=Performance}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                              <ComboBoxItem Tag="Personalization">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🎨 "/>
                                        <Run Text="{Binding personalization, TargetNullValue=Personalization}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                            <ComboBoxItem Tag="Power">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🔋 "/>
                                        <Run Text="{Binding power, TargetNullValue=Power}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                            <ComboBoxItem Tag="Protection">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🛡 "/>
                                        <Run Text="{Binding protection, TargetNullValue=Protection}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                              <ComboBoxItem Tag="Classic">
                                    <TextBlock Foreground="{Binding RelativeSource={RelativeSource AncestorType=ComboBoxItem}, Path=Foreground}">
                                        <Run Text="🕰 "/>
                                        <Run Text="{Binding classic, TargetNullValue=Classic}"/>
                                    </TextBlock>
                                </ComboBoxItem>

                        </ComboBox>
                    <!--End TwaeksCategory-->

                    <ListView Name="tweakslist" AlternationCount="2" Grid.Row="1">
                        <ListView.ItemsPanel>
                            <ItemsPanelTemplate>
                                <VirtualizingStackPanel />
                            </ItemsPanelTemplate>
                        </ListView.ItemsPanel>
                        <ListView.ItemTemplate>
                            <DataTemplate>
                                <StackPanel Orientation="Vertical" Margin="15">
                                    <CheckBox IsChecked="{Binding IsChecked}" Content="{Binding Content}" FontSize="15"/>
                                    <TextBlock Margin="10" FontSize="14" Foreground="{DynamicResource TextColorSecondaryColor2}" Text="{Binding Description}" Width="666"/>
                                </StackPanel>
                            </DataTemplate>
                        </ListView.ItemTemplate>
                    </ListView>

                </Grid>
                
            </TabItem>

                <TabItem x:Name="SettingsTab" Header="{Binding settings, TargetNullValue=Settings}">
                    <TabItem.HeaderTemplate>
                        <DataTemplate>
                            <StackPanel Orientation="Vertical">
                                <TextBlock Text="⚙" VerticalAlignment="Center" HorizontalAlignment="Center"  FontSize="18"/>
                                <TextBlock Text="{Binding}" FontSize="12" VerticalAlignment="Center" HorizontalAlignment="Center"/>
                            </StackPanel>
                        </DataTemplate>
                </TabItem.HeaderTemplate>

                    <ListView Name="SettingsList" 
                        AlternationCount="2">
                        <ListView.ItemsPanel>
                            <ItemsPanelTemplate>
                                <VirtualizingStackPanel />
                            </ItemsPanelTemplate>
                        </ListView.ItemsPanel>
                                <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Show file extensions" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="Showfileextensions" ToolTip="Protection"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Protection}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Show Super Hidden" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="ShowSuperHidden" ToolTip="Protection"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Protection}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Dark Mode" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="DarkMode" ToolTip="Personalization"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Personalization}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="NumLook" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="NumLook" ToolTip="Protection"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Protection}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Sticky Keys" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="StickyKeys" ToolTip="Personalization"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Personalization}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Mouse Acceleration" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="MouseAcceleration" ToolTip="Personalization"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Personalization}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="End Task On Taskbar Windows 11" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="EndTaskOnTaskbarWindows11" ToolTip="Personalization"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Personalization}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Clear Page File At Shutdown" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="ClearPageFileAtShutdown" ToolTip="Performance"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Performance}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Auto End Tasks" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="AutoEndTasks" ToolTip="Performance"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Performance}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Performance Options" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="PerformanceOptions" ToolTip="Performance"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Performance}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Launch To This PC" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="LaunchToThisPC" ToolTip="Personalization"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Personalization}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Disable Automatic Driver Installation" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="DisableAutomaticDriverInstallation" ToolTip="Drivers"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Drivers}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Always show icons never Thumbnail" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="AlwaysshowiconsneverThumbnail" ToolTip="Performance"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Performance}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Core Isolation Memory Integrity" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="CoreIsolationMemoryIntegrity" ToolTip="Security"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Security}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Windows Sandbox" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="WindowsSandbox" ToolTip="Development"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Development}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="Windows Subsystem for Linux" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="WindowsSubsystemforLinux" ToolTip="Development"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Development}"/>
            </StackPanel>
        </StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
            <StackPanel Orientation="Horizontal">
                <CheckBox Content="HyperV Virtualization" FontSize="15" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="HyperVVirtualization" ToolTip="Development"/>
                <TextBlock Margin="8" FontSize="11" Text="{Binding Development}"/>
            </StackPanel>
        </StackPanel>
                    </ListView>
                    
            </TabItem>

    </TabControl>
<!--End TabControl-->
        <Grid Row="2">
  <Grid.ColumnDefinitions>
    <ColumnDefinition Width="*"/>
    <ColumnDefinition Width="auto"/>
  </Grid.ColumnDefinitions>
  <!-- Begin Buttons -->
     <Grid Column="1" Background="Transparent">
      <!--Begin Install Button-->
        <Button
          Name="installBtn"
          Content="{Binding Install, TargetNullValue=Install}"
          HorizontalAlignment="Center"
          VerticalAlignment="Center"
          HorizontalContentAlignment="Center"
          VerticalContentAlignment="Center"
          Width="140" 
          Height="45" 
          Margin="20">
        </Button>
      <!--End Install Button-->
      <!--Begin Apply Button-->
          <Button
            Name="applyBtn"
            Content="{Binding Apply, TargetNullValue=Apply}"
            Visibility="Collapsed"
            HorizontalAlignment="Center"
            VerticalAlignment="Center"
            HorizontalContentAlignment="Center"
            VerticalContentAlignment="Center"
            Width="140" 
            Height="45" 
            Margin="20">
          </Button>
      <!--End Apply Button-->
    </Grid>
  <!-- End Buttons -->
  <!-- Begin Statusbar -->
    <Grid Column="0">
        <TextBlock Name="statusbar"
          Text="✊ #StandWithPalestine"
          HorizontalAlignment="Left"
          VerticalAlignment="Center" 
          TextWrapping="Wrap"
          FontWeight="SemiBold"
          Padding="10 0 0 0"
          Width="auto"
        />
    </Grid>
  <!-- End Statusbar -->
</Grid>
        <Popup Name="EventPopup"
       Placement="Center"
       StaysOpen="False"
       AllowsTransparency="True"
       Focusable="False"
       PopupAnimation="Fade"
       Width="486" Height="600">
    
    <Border Background="{DynamicResource PrimaryBackgroundColor}" 
            BorderBrush="{DynamicResource SecondaryPrimaryBackgroundColor}" 
            BorderThickness="4" 
            CornerRadius="10"
            Opacity="0">
        <Border.Triggers>
            <EventTrigger RoutedEvent="Border.Loaded">
                <BeginStoryboard>
                    <Storyboard>
                        <DoubleAnimation Storyboard.TargetProperty="Opacity" From="0" To="1" Duration="0:0:0.5"/>
                    </Storyboard>
                </BeginStoryboard>
            </EventTrigger>
        </Border.Triggers>

        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="auto"/>
            </Grid.RowDefinitions>

            <StackPanel x:Name="MainStackPanel" Height="Auto" Background="Transparent" Orientation="Vertical" Margin="20">
                <!-- Title -->
                <Grid Background="Transparent">
                    <StackPanel Orientation="Vertical" Margin="0">
                        <TextBlock Name="title"
                                   Height="Auto"
                                   Width="Auto"
                                   FontSize="20"
                                   Text="Whats New"
                                   Foreground="{DynamicResource TextColorSecondaryColor}"
                                   FontWeight="SemiBold"
                                   TextWrapping="Wrap"
                                   VerticalAlignment="Center"
                                   HorizontalAlignment="Left"/>
                        <TextBlock Name="date"
                                   Height="Auto"
                                   Width="Auto"
                                   Margin="5,8,0,0"
                                   Text="8/29/2024"
                                   Foreground="{DynamicResource TextColorSecondaryColor2}"
                                   TextWrapping="Wrap"
                                   VerticalAlignment="Center"
                                   HorizontalAlignment="Left"/>
                    </StackPanel>
                </Grid>
            </StackPanel>

            <Grid Grid.Row="1" Background="Transparent">
                <ScrollViewer Name="ScrollViewer" VerticalScrollBarVisibility="Auto" Height="Auto">
                    <StackPanel Orientation="Vertical">
                        <Image x:Name='ps' Cursor='Hand' Margin='15' Height='400' Width='400' HorizontalAlignment='Center'>
                    <Image.Source>
                        <BitmapImage UriSource='https://camo.githubusercontent.com/5cf02c5ee4898f8f92965367dfbf6829cf7d5e180f3808898ac65eccb0835d68/68747470733a2f2f7374796c65732e7265646469746d656469612e636f6d2f74355f327168616b2f7374796c65732f696d6167655f7769646765745f3738637964797a6c336b7462312e706e67' CacheOption='OnLoad'/>
                    </Image.Source>
                </Image> 
<TextBlock Text='Your support for the Palestinian cause is invaluable, especially in these challenging times. Donations play a crucial role in providing essential services to those affected by the ongoing genocide and helping to sustain long-term development efforts. Supporting trusted organizations allows your contributions to have a direct impact, offering humanitarian aid and food, medical assistance, legal support, and more.' FontSize='16' Padding='25 0 0 10' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap' MaxWidth='450'/>
<TextBlock Text=' • Keyboard Shortcuts' FontSize='20' Padding='10 25 0 20' Foreground='{DynamicResource PrimaryButtonForeground}' FontWeight='bold' TextWrapping='Wrap'/>

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Ctrl+A: Clear category filter.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Ctrl+F: toggle search mode.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Ctrl+Q: Switch to Apps.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Ctrl+W: Switch to Tweaks.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Ctrl+E: Switch to Settings.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Ctrl+S: Install selected Apps/Tweaks.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Shift+S: Save selected.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Shift+D: Load save file.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Shift+M: Toggle music.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Shift+P: Open Choco folder.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Shift+T: Open ITT folder.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Shift+Q: Restore point.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Shift+I: ITT Shortcut.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                

                <StackPanel Orientation='Vertical'>
                    <TextBlock Text='• Ctrl+G: Close application.' Padding='35,0,0,0' FontSize='16' Width='Auto' Height='Auto' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap'/>
                </StackPanel>
                
<TextBlock Text=' • 💡 A Secret Feature Awaits – Unlock It' FontSize='20' Padding='10 25 0 20' Foreground='{DynamicResource PrimaryButtonForeground}' FontWeight='bold' TextWrapping='Wrap'/>
<TextBlock Text='Can You Find the Hidden Easter Egg? Open the source code and uncover the secret features waiting for you!' FontSize='16' Padding='25 0 0 10' Foreground='{DynamicResource TextColorSecondaryColor}' TextWrapping='Wrap' MaxWidth='450'/>

                    </StackPanel>
                </ScrollViewer>
            </Grid>

            <Grid Grid.Row="2" Background="Transparent">
                <TextBlock Name="DisablePopup"
                           Foreground="{DynamicResource TextColorSecondaryColor2}"
                           Text="Show on update"
                           Background="Transparent"
                           TextAlignment="Center"
                           Cursor="Hand"
                           Padding="15"
                           Visibility="Visible"
                           HorizontalAlignment="Center"
                           VerticalAlignment="Center"/>
            </Grid>
        </Grid>
    </Border>
</Popup>
        <Popup
    x:Name="AboutPopup"
    AllowsTransparency="True"
    Placement="Center"
    StaysOpen="False"
    PopupAnimation="Fade"
    IsOpen="false">

    <Border 
        Background="{DynamicResource PrimaryBackgroundColor}" 
        BorderBrush="DarkGray" 
        BorderThickness="1"
        Width="360"
        Height="300"
        Padding="10"
        CornerRadius="10"
        SnapsToDevicePixels="True">

        <Grid Margin="8">

            <Grid.RowDefinitions>
                <RowDefinition Height="auto"/>
                <RowDefinition Height="auto"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- Logo Section -->
            <Grid Grid.Row="0">
                <StackPanel Orientation="Vertical">
                    <TextBlock Text="itt" VerticalAlignment="Center" FontFamily="arial" FontWeight="bold" FontSize="88" Margin="0 2 0 0" Foreground="{DynamicResource logo}" TextAlignment="Center" HorizontalAlignment="Center" Style="{DynamicResource logoText}"/>
                    <TextBlock Text="Made by Emad Adel" HorizontalAlignment="Center" Foreground="{DynamicResource TextColorSecondaryColor}" TextAlignment="Center" Margin="0 2 0 8"/>
                    <TextBlock Name="ver" TextAlignment="Center" Foreground="{DynamicResource TextColorSecondaryColor}"/>
                </StackPanel>
            </Grid>

            <!-- Contribute Names Section -->
            <StackPanel Grid.Row="1">
                <TextBlock Text="Contributors" TextWrapping="Wrap" HorizontalAlignment="center" Foreground="{DynamicResource TextColorSecondaryColor}"/>
                <ScrollViewer VerticalScrollBarVisibility="Auto" Height="90">
                    <StackPanel Margin="5,0,0,0">
                        <TextBlock Text="emadadel4" Margin="1" Foreground="{DynamicResource TextColorSecondaryColor}" />
<TextBlock Text="yousefmhmd" Margin="1" Foreground="{DynamicResource TextColorSecondaryColor}" />
                    </StackPanel>
                </ScrollViewer>
            </StackPanel>

            <!-- Links Section -->
            <StackPanel Grid.Row="2" Orientation="Horizontal" HorizontalAlignment="center" Margin="0">
                <TextBlock Text="Source Code" Foreground="{DynamicResource TextColorSecondaryColor}" Name="github" Cursor="Hand" Margin="0"/>
            </StackPanel>

        </Grid>
    </Border>
</Popup>
        
</Grid>
</Window>
<!--End Main Window-->

"@
#===========================================================================
#endregion End WPF Main Window
#===========================================================================
#===========================================================================
#region Begin loadXmal
#===========================================================================
# Set the maximum number of threads for the RunspacePool to the number of threads on the machine
$maxthreads = [int]$env:NUMBER_OF_PROCESSORS
# Create a new session state for parsing variables into our runspace
$hashVars = New-object System.Management.Automation.Runspaces.SessionStateVariableEntry -ArgumentList 'itt', $itt, $Null
$InitialSessionState = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
# Add the variable to the session state

$InitialSessionState.Variables.Add($hashVars)

$functions = @(
    'Install-App','Install-Dependencies','InvokeCommand', 'Add-Log',
    'Disable-Service', 'Uninstall-AppxPackage', 'Finish', 'Message',
    'Notify','UpdateUI', 'ExecuteCommand', 'Set-Registry', 'Set-Taskbar',
    'Refresh-Explorer','Remove-ScheduledTasks','CreateRestorePoint','Set-Statusbar'
)

foreach ($func in $functions) {
    $command = Get-Command $func -ErrorAction SilentlyContinue
    if ($command) {
        $InitialSessionState.Commands.Add(
            (New-Object System.Management.Automation.Runspaces.SessionStateFunctionEntry $command.Name, $command.ScriptBlock.ToString())
        )

        #debug start
        Write-Output "Added function: $func"
        #debug end
    }
}

# Create and open the runspace pool
$itt.runspace = [runspacefactory]::CreateRunspacePool(1, $maxthreads, $InitialSessionState, $Host)
$itt.runspace.Open()

# Initialize Main window
try {
    [xml]$MainXaml = $MainWindowXaml
    $itt["window"] = [Windows.Markup.XamlReader]::Load([System.Xml.XmlNodeReader]$MainXaml)
}
catch {
    Write-Output "Error: $($_.Exception.Message)"
}
try {
    #===========================================================================
    #region Create default keys
    #===========================================================================
    $appsTheme = Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme"
    $fullCulture = Get-ItemPropertyValue -Path "HKCU:\Control Panel\International" -Name "LocaleName"
    $shortCulture = $fullCulture.Split('-')[0]
    # Ensure registry key exists and set defaults if necessary
    if (-not (Test-Path $itt.registryPath)) {
        New-Item -Path $itt.registryPath -Force | Out-Null
        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
        Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -Force
        Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value 0 -Force
        Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 0 -Force
        Set-ItemProperty -Path $itt.registryPath -Name "backup" -Value 0 -Force
        Set-ItemProperty -Path $itt.registryPath -Name "source" -Value "auto" -Force
    }
    try {
        # Attempt to get existing registry values
        $itt.Theme = (Get-ItemProperty -Path $itt.registryPath -Name "Theme" -ErrorAction Stop).Theme
        $itt.Locales = (Get-ItemProperty -Path $itt.registryPath -Name "locales" -ErrorAction Stop).locales
        $itt.Music = (Get-ItemProperty -Path $itt.registryPath -Name "Music" -ErrorAction Stop).Music
        $itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -ErrorAction Stop).PopupWindow
        $itt.backup = (Get-ItemProperty -Path $itt.registryPath -Name "backup" -ErrorAction Stop).backup
        $itt.PackgeManager = (Get-ItemProperty -Path $itt.registryPath -Name "source" -ErrorAction Stop).source
    }
    catch {
        # Creating missing registry keys
        # debug start
        if ($Debug) { Add-Log -Message "An error occurred. Creating missing registry keys..." -Level "debug" }
        # debug end
        New-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -PropertyType String -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -PropertyType String -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "Music" -Value 0 -PropertyType DWORD -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 0 -PropertyType DWORD -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "backup" -Value 0 -PropertyType DWORD -Force *> $Null
        New-ItemProperty -Path $itt.registryPath -Name "source" -Value "auto" -PropertyType String -Force *> $Null

    }
    #===========================================================================
    #endregion Create default keys
    #===========================================================================
    #===========================================================================
    #region Set Language based on culture
    #===========================================================================
    try {
        $Locales = switch ($itt.Locales) {
            "default" {
                switch ($shortCulture) {
                            
                "ar" {"ar"}        
                "de" {"de"}        
                "en" {"en"}        
                "es" {"es"}        
                "fr" {"fr"}        
                "hi" {"hi"}        
                "it" {"it"}        
                "ko" {"ko"}        
                "ru" {"ru"}        
                "tr" {"tr"}        
                "zh" {"zh"}
                    default { "en" }
                }
            }
                    
                "ar" {"ar"}        
                "de" {"de"}        
                "en" {"en"}        
                "es" {"es"}        
                "fr" {"fr"}        
                "hi" {"hi"}        
                "it" {"it"}        
                "ko" {"ko"}        
                "ru" {"ru"}        
                "tr" {"tr"}        
                "zh" {"zh"}
            default { "en" }
        }
        $itt["window"].DataContext = $itt.database.locales.Controls.$Locales
        $itt.Language = $Locales
    }
    catch {
        # fallbak to en lang
        $itt["window"].DataContext = $itt.database.locales.Controls.en
    }
    #===========================================================================
    #endregion Set Language based on culture
    #===========================================================================
    #===========================================================================
    #region Check theme settings
    #===========================================================================
    try {
        $Themes = switch ($itt.Theme) {
                            
            "Dark" {"Dark"}                
            "DarkKnight" {"DarkKnight"}                
            "Light" {"Light"}                
            "Palestine" {"Palestine"}
            default {
                switch ($appsTheme) {
                    "0" { 
                        "Dark"
                        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
                    }
                    "1" { 
                        
                        "Light" 
                        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
                    }
                }
            }
        }
        $itt["window"].Resources.MergedDictionaries.Add($itt["window"].FindResource($Themes))
        $itt.Theme = $Themes
    }
    catch {
        # Fall back to default theme if there error
        $fallback = switch ($appsTheme) {
            "0" { "Dark" }
            "1" { "Light" }
        }
        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
        $itt["window"].Resources.MergedDictionaries.Add($itt["window"].FindResource($fallback))
        $itt.Theme = $fallback
    }
    #===========================================================================
    #endregion Check theme settings
    #===========================================================================
    #===========================================================================
    #region Get user Settings from registry
    #===========================================================================
    $itt.mediaPlayer.settings.volume = "$($itt.Music)"
    $itt["window"].title = "Install Tweaks Tool " + @("🔈", "🔊")[$itt.Music -eq 100]
    $itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow").PopupWindow
    #===========================================================================
    #endregion Get user Settings from registry
    #===========================================================================
    # init taskbar icon
    $itt["window"].TaskbarItemInfo = New-Object System.Windows.Shell.TaskbarItemInfo
    if (-not $Debug) { Set-Taskbar -progress "None" -icon "logo" }
}
catch {
    Write-Output "Error: $_"
}
#===========================================================================
#region Initialize WPF Controls
#===========================================================================

# List Views
$popup = $itt["window"].FindName("EventPopup")
$itt.CurrentList
$itt.CurrentCategory
$itt.TabControl = $itt["window"].FindName("taps")
$itt.AppsListView = $itt["window"].FindName("appslist")
$itt.TweaksListView = $itt["window"].FindName("tweakslist")
$itt.SettingsListView = $itt["window"].FindName("SettingsList")

# Buttons and Inputs
$itt.Description = $itt["window"].FindName("description")
$itt.Statusbar = $itt["window"].FindName("statusbar")
$itt.InstallBtn = $itt["window"].FindName("installBtn")
$itt.ApplyBtn = $itt["window"].FindName("applyBtn")
$itt.installText = $itt["window"].FindName("installText")
$itt.installIcon = $itt["window"].FindName("installIcon")
$itt.applyText = $itt["window"].FindName("applyText")
$itt.applyIcon = $itt["window"].FindName("applyIcon")
$itt.QuoteIcon = $itt["window"].FindName("QuoteIcon")
#===========================================================================
#endregion Initialize WPF Controls
#===========================================================================

#===========================================================================
#region Fetch Data
#===========================================================================
$h = [System.Net.Http.HttpClientHandler]::new()
$h.AutomaticDecompression = [System.Net.DecompressionMethods] 'GZip,Deflate'
$c = [System.Net.Http.HttpClient]::new($h)

$appsUrl   = "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/update/static/Database/Applications.json"
$tweaksUrl = "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/update/static/Database/Tweaks.json"

try {
    Write-Host "Getting Latest Apps and Tweaks..." -ForegroundColor Yellow
    $aTask, $tTask = $c.GetStringAsync($appsUrl), $c.GetStringAsync($tweaksUrl)
    [Threading.Tasks.Task]::WaitAll($aTask, $tTask)
    $itt.AppsListView.ItemsSource   = $aTask.Result | ConvertFrom-Json
    $itt.TweaksListView.ItemsSource = $tTask.Result | ConvertFrom-Json
}
catch {
    Write-Host "Unstable internet connection detected. Retrying in 8 seconds..." -ForegroundColor Yellow
    Start-Sleep 8
    & $MyInvocation.MyCommand.Definition
}
#===========================================================================
#endregion Fetch Data
#===========================================================================
#===========================================================================
#endregion End loadXmal
#===========================================================================
#===========================================================================
#region Begin Main
#===========================================================================
#=========================================================================== 
#region Select elements with a Name attribute using XPath and iterate over them
#=========================================================================== 
$MainXaml.SelectNodes("//*[@Name]") | ForEach-Object {
    $name = $_.Name
    $element = $itt["window"].FindName($name)

    if ($element) {
        $itt[$name] = $element
        $type = $element.GetType().Name

        switch ($type) {
            "Button" { $element.Add_Click({ Invoke-Button $this.Name $this.Content }) }
            "MenuItem" { $element.Add_Click({ Invoke-Button $this.Name -Content $this.Header }) }
            "TextBox" { $element.Add_TextChanged({ Invoke-Button $this.Name $this.Text }) }
            "TextBlock" { $element.Add_MouseLeftButtonDown({ Invoke-Button $this.Name $this.Text }) }
            "ComboBox" { $element.add_SelectionChanged({ Invoke-Button $this.Name $this.SelectedItem.Content }) }
            "TabControl" { $element.add_SelectionChanged({ Invoke-Button $this.Name $this.SelectedItem.Name }) }
            "CheckBox" {
                $element.IsChecked = Get-ToggleStatus -ToggleSwitch $name
                $element.Add_Click({ Invoke-Toggle $this.Name })
            }
        }
    }
}
#=========================================================================== 
#endregion Select elements with a Name attribute using XPath and iterate over them
#=========================================================================== 

# Define OnClosing event handler
$onClosingEvent = {
    param($s, $c)
    # Show confirmation message box
    $result = Message -key "Exit_msg" -icon "ask" -action "YesNo"
    if ($result -eq "Yes") {
        Manage-Music -action "StopAll" 
    }
    else {
        $c.Cancel = $true
    }
}

$itt["window"].Add_ContentRendered({
    Startup
    Show-Event

    # Quick install
    if ($i) {
        Quick-Install -file $i *> $null
    }
})

# Close event handler
$itt["window"].add_Closing($onClosingEvent)

# Keyboard shortcut
$itt["window"].Add_PreViewKeyDown($KeyEvents)

# Show Window
$itt["window"].ShowDialog() | Out-Null

# Dispose of runspaces and other objects
$itt.runspace.Dispose()
$itt.runspace.Close()

# Collect garbage
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

# Stop PowerShell session and release resources
$script:powershell.Dispose()
$script:powershell.Stop()

# Stop transcript logging
Stop-Transcript *> $null
#===========================================================================
#endregion End Main
#===========================================================================
