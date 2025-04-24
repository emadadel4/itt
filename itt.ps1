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
Add-Type -AssemblyName 'System.Windows.Forms', 'PresentationFramework', 'PresentationCore', 'WindowsBase'

# Synchronized Hashtable for shared variables
$itt = [Hashtable]::Synchronized(@{

    database       = @{}
    ProcessRunning = $false
    lastupdate     = "04/24/2025"
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
#region Begin Database /APPS/TWEEAKS/Quotes/OST/Settings
#===========================================================================
$itt.database.locales = @'
{"Controls":{"ar":{"name":"عربي","Welcome":"توفر هذه الأداة تسهيلات كبيرة في عملية تثبيت البرامج وتحسين الويندوز. انضم إلينا وكن جزءًا في تطويرها","System_Info":"معلومات النظام","Power_Options":"خيارات الطاقة","Device_Manager":"إدارة الأجهزة","Services":"خدمات","Networks":"شبكات","Apps_features":"التطبيقات و الميزات","Task_Manager":"مدير المهام","Disk_Managment":"إدارة القرص","Msconfig":"تكوين النظام","Environment_Variables":"متغيرات بيئة النظام","Install":"تثبيت","Apply":"تطبيق","Downloading":"...جارٍ التحميل","About":"عن الاداة","Third_party":"ادوات اخرى","Preferences":"التفضيلات","Management":"إدارة الجهاز","Apps":"برامج","Tweaks":"تحسينات","Settings":"إعدادات","Save":"حفظ البرامج","Restore":"أسترجاع البرامج","Music":"الموسيقى","On":"تشغيل ","Off":"كتم","Dark":"ليلا","Light":"نهارا","Use_system_setting":"استخدم إعدادات النظام","Create_desktop_shortcut":"أنشاء أختصار على سطح المكتب","Reset_preferences":" إعادة التفضيلات إلى الوضع الافتراضي","Reopen_itt_again":"يرجى اعادة فتح الاداة مرة اخرى","Theme":"المظهر","Language":"اللغة","MAS":"تفعيل الويندوز","Win_Office":"تحميل ويندوز / أوفيس","IDM":"تفعيل الدونلود مانجر","Browsers_extensions":"أضافات المتصفحات","All":"الكل","Search":"بحث","Create_restore_point":"إنشاء نقطة الاستعادة","Portable_Downloads_Folder":"مجلد التنزيلات المحمولة","Install_msg":"هل تريد تثبيت البرامج التالية","Apply_msg":"هل تريد تطبيق التحسينات التالية","Applying":"...جارٍي التطبيق","Please_wait":"يرجى الانتظار، يوجد عملية في الخلفية","Last_update":"آخر تحديث","Exit_msg":"هل أنت متأكد من رغبتك في إغلاق البرنامج؟ إذا كان هناك أي تثبيتات، فسيتم إيقافها.","Happy_birthday":"!عيد ميلاد سعيد عماد","My_playlist":"انه عيد ميلادي و قائمة الموسيقى الخاصة بي","Empty_save_msg":"يرجى اختيار تطبيق واحد على الاقل لحفظه","easter_egg":"تقدر تكتشف الميزة المخفية؟ تصفح الكود، وكن أول واحد يكتشف الميزة، ويضيفها للأداة"},"de":{"name":"Deutsch","Welcome":"Sparen Sie Zeit indem Sie mehrere Programme gleichzeitig instAllieren und die Leistung Ihres Windows steigern. Schließen Sie sich uns an um dieses Tool zu verbessern und noch besser zu machen. Sie können auch Ihre Lieblings-Musik-Apps und Anpassungen hinzufügen.","Install":"InstAllieren","Apply":"Anwenden","Downloading":"Herunterladen...","About":"Über","Third_party":"Drittanbieter","Preferences":"Einstellungen","Management":"Verwaltung","Apps":"Apps","Tweaks":"Optimierungen","Settings":"Einstellungen","Save":"Speichern","Restore":"Wiederherstellen","Music":"Musik","On":"Ein ","Off":"Aus","Disk_Managment":"Datenträgerverwaltung","Msconfig":"Systemkonfiguration","Environment_Variables":"Umgebungsvariablen","Task_Manager":"Task-Manager","Apps_features":"Apps-FunktiOnen","Networks":"Netzwerke","Services":"Dienste","Device_Manager":"Geräte-Manager","Power_Options":"EnergieoptiOnen","System_Info":"Systeminfo","Use_system_setting":"Systemeinstellungen verwenden","Create_desktop_shortcut":"Desktop-Verknüpfung erstellen","Reset_preferences":"Einstellungen zurücksetzen","Reopen_itt_again":"Bitte ITT erneut öffnen.","Theme":"Thema","Language":"Sprache","MAS":"Microsoft Aktivierungsskripte (MAS)","Win_Office":"Windows / Office ISO herunterladen","IDM":"IDM-Aktivierung","Browsers_extensions":"Browser-Erweiterungen","All":"Alle","Search":"Suchen","Create_restore_point":"Wiederherstellungspunkt erstellen","Portable_Downloads_Folder":"Ordner für tragbare Downloads","Install_msg":"Sind Sie sicher  dass Sie die folgenden Anwendungen instAllieren möchten?","Apply_msg":"Sind Sie sicher dass Sie die folgenden Anpassungen anwenden möchten?","Applying":"Anwenden...","Please_wait":"Bitte warten ein Prozess läuft im Hintergrund.","Last_update":"Letztes Update","Exit_msg":"Sind Sie sicher dass Sie das Programm schließen möchten? Alle InstAllatiOnen werden abgebrochen.","Happy_birthday":"Alles Gute zum Geburtstag mir!","My_playlist":"Es ist mein Geburtstag und meine Playlist ♪","Empty_save_msg":"Wählen Sie mindestens eine App zum Speichern aus.","easter_egg":"Kannst du das verborgene Geheimnis entdecken? Tauche in den Quellcode ein"},"en":{"name":"English","Welcome":"Save time and install all your programs at once and debloat Windows and more. Be part of ITT and contribute to improving it","Install":"Install","Apply":"Apply","Downloading":"Downloading...","About":"About","Third_party":"Third-party","Preferences":"Preferences","Management":"Management","Apps":"Apps","Tweaks":"Tweaks","Settings":"Settings","Save":"Save","Restore":"Restore","Music":"Music","On":"On","Off":"Off","Disk_Managment":"Disk Managment","Msconfig":"System Configuration","Environment_Variables":"Environment Variables","Task_Manager":"Task Manager","Apps_features":"Programs and Features","Networks":"Networks","Services":"Services","Device_Manager":"Device Manager","Power_Options":"Power options","System_Info":"System Info","Use_system_setting":"Use system setting","Create_desktop_shortcut":"Create desktop shortcut","Reset_preferences":"Reset Preferences","Reopen_itt_again":"Please reopen itt again.","Theme":"Theme","Language":"Language","MAS":"Microsoft Activation Scripts (MAS)","Win_Office":"Windows / Office ISO (MAS)","IDM":"IDM Activation (J2TEAM)","Browsers_extensions":"Browsers extensions","All":"All","Search":"Search","Create_restore_point":"Create a restore point","Portable_Downloads_Folder":"Portable Downloads Folder","Install_msg":"Are you sure you want to install the following App(s)","Apply_msg":"Are you sure you want to apply the following Tweak(s)","Applying":"Applying...","Please_wait":"Please wait  a process is running in the background","Last_update":"Last update","Exit_msg":"Are you sure you want to close the program? Any ongoing installations will be canceled.","Happy_birthday":"Happy Birthday to me!","My_playlist":"It's my Birthday and My Playlist ♪","Empty_save_msg":"Choose at least One app to save it","easter_egg":"Can you uncover the hidden secret? Dive into the source code"},"es":{"name":"Español","Welcome":"Ahorra tiempo instalando varios prograMAS a la vez y mejora el rendimiento de tu Windows. Únete a nosotros para mejorar esta herramienta y hacerla aún mejor. También puedes agregar tus aplicaciOnes Musicales y ajustes favoritos.","Install":"Instalar","Apply":"Aplicar","Downloading":"Descargando...","About":"Acerca de","Third_party":"Terceros","Preferences":"Preferencias","Management":"Gestión","Apps":"AplicaciOnes","Tweaks":"Ajustes","Settings":"COnfiguración","Save":"Guardar","Restore":"Restaurar","Music":"Música","On":"Encendido","Off":"Apagado","Disk_Managment":"Administración de discos","Msconfig":"Configuración del sistema","Environment_Variables":"Variables de entorno","Task_Manager":"Administrador de tareas","Apps_features":"AplicaciOnes-FunciOnes","Networks":"Redes","Services":"Servicios","Device_Manager":"Administrador de dispositivos","Power_Options":"OpciOnes de energía","System_Info":"Información del sistema","Use_system_setting":"Usar la cOnfiguración del sistema","Create_desktop_shortcut":"Crear acceso directo en el escritorio","Reset_preferences":"Restablecer preferencias","Reopen_itt_again":"Vuelve a abrir ITT.","Theme":"Tema","Language":"Idioma","MAS":"Scripts de activación de Microsoft (MAS)","Win_Office":"Descargar ISO de Windows / Office","IDM":"Activación IDM","Browsers_extensions":"ExtensiOnes del navegador","All":"Todos","Search":"Buscar","Create_restore_point":"Crear un punto de restauración","Portable_Downloads_Folder":"Carpeta de descargas portátiles","Install_msg":"¿Estás seguro de que deseas instalar las siguientes aplicaciOnes?","Apply_msg":"¿Estás seguro de que deseas aplicar los siguientes ajustes?","Applying":"Aplicando...","Please_wait":"Por favorespera un proceso se está ejecutando en segundo plano.","Last_update":"Última actualización","Exit_msg":"¿Estás seguro de que deseas cerrar el programa? Si hay instalaciOnes se interrumpirán.","Happy_birthday":"¡Feliz cumpleaños a mí!","My_playlist":"Es mi cumpleaños y mi lista de reproducción ♪","Empty_save_msg":"Elige al menos una aplicación para guardarla.","easter_egg":"¿Puedes descubrir el secreto oculto? Sumérgete en el código fuente"},"fr":{"name":"Français","Welcome":"Gagnez du temps en instAllant plusieurs programmes à la fois et améliorez les performances de votre Windows. Rejoignez-nous pour améliorer cet outil et le rendre encore meilleur. Vous pouvez également ajouter vos applicatiOns Musicales et vos Tweaks préférés.","Install":"InstAller","Apply":"Appliquer","Downloading":"Téléchargement...","About":"À propos","Third_party":"Tiers","Preferences":"Préférences","Management":"GestiOn","Apps":"ApplicatiOns","Tweaks":"OptimisatiOns","Settings":"Paramètres","Save":"Sauvegarder","Restore":"Restaurer","Music":"Musique","On":"Activé ","Off":"Désactivé","Disk_Managment":"GestiOn des disques","Msconfig":"Configuration du système","Environment_Variables":"Variables d'environnement","Task_Manager":"GestiOnnaire des tâches","Apps_features":"ApplicatiOns-FOnctiOnnalités","Networks":"Réseaux","Services":"Services","Device_Manager":"GestiOnnaire de périphériques","Power_Options":"OptiOns d'alimentatiOn","System_Info":"Infos système","Use_system_setting":"Utiliser les paramètres système","Create_desktop_shortcut":"Créer un raccourci sur le bureau","Reset_preferences":"Réinitialiser les préférences","Reopen_itt_again":"Veuillez rouvrir ITT.","Theme":"Thème","Language":"Langue","MAS":"Scripts d'activatiOn Microsoft (MAS)","Win_Office":"Télécharger l'ISO Windows / Office","IDM":"ActivatiOn IDM","Browsers_extensions":"Browsers_extensions de navigateurs","All":"Tout","Search":"Rechercher","Create_restore_point":"Créer un point de restauratiOn","Portable_Downloads_Folder":"Dossier de téléchargements portables","Install_msg":"Êtes-vous sûr de vouloir instAller les applicatiOns suivantes ?","Apply_msg":"Êtes-vous sûr de vouloir appliquer les Tweaks suivants ?","Applying":"ApplicatiOn...","Please_wait":"Veuillez patienter","Last_update":"Dernière mise à jour  un processus est en cours d'exécutiOn en arrière-plan.","Exit_msg":"Êtes-vous sûr de vouloir fermer le programme ? Si des instAllatiOns sOnt en cours  elles serOnt interrompues.","Happy_birthday":"Joyeux anniversaire à moi !","My_playlist":"C'est mOn anniversaire et ma playlist ♪","Empty_save_msg":"Choisissez au moins une applicatiOn à sauvegarder.","easter_egg":"Peux-tu découvrir le secret caché ? Plonge dans le code source"},"ga":{"name":"Gaeilge","Welcome":"Sábháil am trí níos mó ná clár amháin a shuiteáil ag an am céanna agus feabhsaigh feidhmíocht do Windows. Bí linn ag feabhsú an uirlis seo agus ag déanamh é níos fearr. Is féidir leat do chuid Apps ceoil agus feabhsúcháin is fearr leat a chur leis freisin.","Install":"Suiteáil","Apply":"Cuir i bhfeidhm","Downloading":"Ag suiteáil...","About":"Faoi","Third_party":"Tríú páirtí","Preferences":"Roghanna","Management":"Bainistíocht","Apps":"Aplaicí","Tweaks":"Feabhsúcháin","Settings":"Socruithe","Save":"Sábháil","Restore":"Athchóirigh","Music":"Ceol","On":"Ar ","Off":"Múchta","Disk_Managment":"Bainistíocht Diosca","Msconfig":"Cumraíocht an Chórais","Environment_Variables":"Variables d'environnement","Task_Manager":"Bainisteoir Tascanna","Apps_features":"Gnéithe Aipeanna","Networks":"LíOnraí","Services":"Seirbhísí","Device_Manager":"Bainisteoir Gléasanna","Power_Options":"Roghanna Cumhachta","System_Info":"Eolas Córas","Use_system_setting":"Úsáid socrú an chórais","Create_desktop_shortcut":"Cruthaigh gearrthagairt deisce","Reset_preferences":"Athshocraigh Roghanna","Reopen_itt_again":"Oscail ITT arís le do thoil.","Theme":"Téama","Language":"Teanga","MAS":"Scripteanna Gníomhachtaithe Microsoft (MAS)","Win_Office":"Íoslódáil ISO Windows / Office","IDM":"Gníomhachtú IDM","Browsers_extensions":"Síntí Brabhsálaí","All":"Uile","Search":"Cuardaigh","Create_restore_point":"Cruthaigh pointe athchóirithe","Portable_Downloads_Folder":"Fillteán Íoslódálacha Inaistrithe","Install_msg":"An bhfuil tú cinnte gur mhaith leat na feidhmchláir seo a shuiteáil","Apply_msg":"An bhfuil tú cinnte gur mhaith leat na feabhsúcháin seo a chur i bhfeidhm","Applying":"Cur i bhfeidhm...","Please_wait":"Fan le do thoil tá próiseas ag rith sa chúlra","Last_update":"An nuashOnrú deireanach","Exit_msg":"An bhfuil tú cinnte gur mhaith leat an clár a dhúnadh? Má tá suiteálacha ar siúl beidh siad curtha ar ceal.","Happy_birthday":"Breithlá ShOna domsa!","My_playlist":"Is é mo Bhreithlá é agus Mo Phléaráca ♪","Empty_save_msg":"Roghnaigh ar a laghad aip amháin chun é a shábháil","easter_egg":"An féidir leat an rúndiamhair atá i bhfolach a nochtadh? Tum isteach sa chód foinse"},"hi":{"name":"अंग्रेज़ी","Welcome":"एक बार में कई प्रोग्राम इंस्टॉल करके समय बचाएं और अपने विंडोज़ के प्रदर्शन को बढ़ावा दें। इस टूल को बेहतर बनाने और इसे और अच्छा बनाने में हमारा साथ दें। आप अपने पसंदीदा म्यूज़िक ऐप्स और ट्विक्स भी जोड़ सकते हैं।","Install":"इंस्टॉल करें","Apply":"लागू करें","Downloading":"डाउनलोड हो रहा है...","About":"के बारे में","Third_party":"थर्ड-पार्टी","Preferences":"पसंद","Management":"प्रबंधन","Apps":"ऐप्स","Tweaks":"ट्विक्स","Settings":"सेटिंग्स","Save":"सहेजें","Restore":"पुनर्स्थापित करें","Music":"संगीत","On":"चालू ","Off":"बंद","Disk_Managment":"डिस्क प्रबंधन","Msconfig":"सिस्टम कॉन्फ़िगरेशन","Environment_Variables":"एन्विर्बल वार्डियल्स","Task_Manager":"टास्क मैनेजर","Apps_features":"ऐप्स-फीचर्स","Networks":"नेटवर्क्स","Services":"सेवाएँ","Device_Manager":"डिवाइस मैनेजर","Power_Options":"पावर विकल्प","System_Info":"सिस्टम जानकारी","Use_system_setting":"सिस्टम सेटिंग का उपयोग करें","Create_desktop_shortcut":"डेस्कटॉप शॉर्टकट बनाएं","Reset_preferences":"पसंद रीसेट करें","Reopen_itt_again":"कृपया इसे फिर से खोलें।","Theme":"थीम","Language":"भाषा","MAS":"माइक्रोसॉफ्ट एक्टिवेशन स्क्रिप्ट्स (MAS)","Win_Office":"विंडोज़ / ऑफिस ISO (MAS)","IDM":"IDM एक्टिवेशन (WindowsAddict)","Browsers_extensions":"ब्राउज़र एक्सटेंशन","All":"सभी","Search":"खोज","Create_restore_point":"पुनर्स्थापना बिंदु बनाएँ","Portable_Downloads_Folder":"पोर्टेबल डाउनलोड फ़ोल्डर","Install_msg":"क्या आप निश्चित हैं कि आप निम्न ऐप्स इंस्टॉल करना चाहते हैं?","Apply_msg":"क्या आप निश्चित हैं कि आप निम्न ट्विक्स लागू करना चाहते हैं?","Applying":"लागू किया जा रहा है...","Please_wait":"कृपया प्रतीक्षा करें बैकग्राउंड में एक प्रक्रिया चल रही है","Last_update":"आखिरी अपडेट","Exit_msg":"क्या आप निश्चित हैं कि आप प्रोग्राम बंद करना चाहते हैं? यदि कोई इंस्टॉलेशन चल रहा हो तो वह समाप्त हो जाएगा।","Happy_birthday":"मुझे जन्मदिन की शुभकामनाएँ!","My_playlist":"यह मेरा जन्मदिन है और मेरी प्लेलिस्ट ♪","Empty_save_msg":"कम से कम एक ऐप चुनें और उसे सहेजें।","easter_egg":"क्या आप छिपे हुए रहस्य को उजागर कर सकते हैं? सोर्स कोड में डूबकी लगाएं"},"it":{"name":"Italiano","Welcome":"Risparmia tempo installando più programmi contemporaneamente e migliora le prestazioni di Windows. Unisciti a noi per migliorare questo strumento e renderlo migliore. Puoi anche aggiungere le tue app musicali preferite e le personalizzazioni.","Install":"Installa","Apply":"Applica","Downloading":"Download in corso...","About":"Informazioni","Third_party":"Terze parti","Preferences":"Preferenze","Management":"Gestione","Apps":"App","Tweaks":"Personalizzazioni","Settings":"Impostazioni","Save":"Salva","Restore":"Ripristina","Music":"Musica","On":"Acceso","Off":"Spento","Disk_Managment":"Gestione disco","Msconfig":"Configurazione di sistema","Environment_Variables":"Variabili di ambiente","Task_Manager":"Gestore attività","Apps_features":"App-Funzionalità","Networks":"Reti","Services":"Servizi","Device_Manager":"Gestore dispositivi","Power_Options":"Opzioni risparmio energia","System_Info":"Informazioni di sistema","Use_system_setting":"Usa impostazioni di sistema","Create_desktop_shortcut":"Crea collegamento sul desktop","Reset_preferences":"Reimposta preferenze","Reopen_itt_again":"Per favore riapri di nuovo.","Theme":"Tema","Language":"Lingua","MAS":"Microsoft Activation Scripts (MAS)","Win_Office":"Windows / Office ISO (MAS)","IDM":"Attivazione IDM (WindowsAddict)","Browsers_extensions":"Estensioni per browser","All":"Tutti","Search":"Cerca","Create_restore_point":"Crea un punto di ripristino","Portable_Downloads_Folder":"Cartella download portatile","Install_msg":"Sei sicuro di voler installare le seguenti app?","Apply_msg":"Sei sicuro di voler applicare le seguenti personalizzazioni?","Applying":"Applicazione in corso...","Please_wait":"Attendere un processo è in corso in background","Last_update":"Ultimo aggiornamento","Exit_msg":"Sei sicuro di voler chiudere il programma? Se ci sono installazioni in corso verranno terminate.","Happy_birthday":"Buon compleanno a me!","My_playlist":"È il mio compleanno e la mia playlist ♪","Empty_save_msg":"Scegli almeno un'app per salvarla.","easter_egg":"Riuscirai a scoprire il segreto nascosto? Tuffati nel codice sorgente"},"ko":{"name":"한국어","Welcome":"여러 프로그램을 한 번에 설치하여 시간을 절약하고 Windows 성능을 향상시킵니다. 도구를 개선하고 우리와 함께 훌륭하게 만들어 보세요.","System_Info":"시스템 정보","Power_Options":"전원 옵션","Device_Manager":"장치 관리자","Services":"서비스","Networks":"네트워크","Apps_features":"앱 기능","Task_Manager":"작업 관리자","Disk_Managment":"디스크 관리","Msconfig":"시스템 구성","Environment_Variables":"연습별 변수","Install":"설치","Apply":"적용","Downloading":"다운로드 중","About":"정보","Third_party":"외부","Preferences":"환경 설정","Management":"관리","Apps":"앱","Tweaks":"설정","Settings":"설정","Save":"선택한 앱 저장","Restore":"선택한 앱 복원","Music":"음악","On":"켜기","Reset_preferences":"환경 설정 초기화","Off":"끄기","Dark":"다크","Light":"라이트","Use_system_setting":"시스템","Create_desktop_shortcut":"바탕화면 바로 가기 만들기","Reopen_itt_again":"ITT를 다시 열어주세요.","Theme":"테마","Language":"언어","MAS":"Microsoft 활성화 스크립트 (MAS)","Win_Office":"Windows / Office ISO 다운로드","IDM":"IDM 활성화","Browsers_extensions":"브라우저 확장 프로그램","All":"모두","Create_restore_point":"복원 지점 생성","Portable_Downloads_Folder":"휴대용 다운로드 폴더","Install_msg":"선택한 앱을 설치하시겠습니까","Apply_msg":"선택한 조정 사항을 적용하시겠습니까","instAlling":"설치 중..","Applying":"적용 중..","Please_wait":"배경에서 프로세스가 진행 중입니다. 잠시 기다려주세요.","Last_update":"마지막 업데이트","Exit_msg":"프로그램을 종료하시겠습니까? 진행 중인 설치가 있으면 중단됩니다.","Happy_birthday":"생일 축하합니다 Emad!","My_playlist":"제 생일과 제 플레이리스트 ♪","easter_egg":"隠された秘密を見つけられますか？ソースコードに飛び込んで、最初に機能を発見し、ツールに統合しましょう。"},"ru":{"name":"Русский","Welcome":"Сэкономьте время устанавливая несколько программ одновременно и улучшите производительность Windows. Присоединяйтесь к нам для улучшения этого инструмента и его совершенствования. Вы также можете добавить свои любимые музыкальные приложения и настройки.","Install":"Установить","Apply":"Применить","Downloading":"Загрузка...","About":"О нас","Third_party":"Сторонние","Preferences":"Настройки","Management":"Управление","Apps":"Приложения","Tweaks":"Настройки","Settings":"Параметры","Save":"Сохранить","Restore":"Восстановить","Music":"Музыка","On":"Вкл ","Off":"Выкл","Disk_Managment":"Управление дисками","Msconfig":"Конфигурация системы","Environment_Variables":"Переменные окружения","Task_Manager":"Диспетчер задач","Apps_features":"Приложения-Функции","Networks":"Сети","Services":"Сервисы","Device_Manager":"Диспетчер устройств","Power_Options":"Энергопитание","System_Info":"Информация о системе","Use_system_setting":"Использовать системные настройки","Create_desktop_shortcut":"Создать ярлык на рабочем столе","Reset_preferences":"Сбросить настройки","Reopen_itt_again":"Пожалуйста перезапустите ITT.","Theme":"Тема","Language":"Язык","MAS":"Microsoft ActivatiOn Scripts (MAS)","Win_Office":"Скачать ISO Windows / Office","IDM":"Активация IDM","Browsers_extensions":"Расширения для браузеров","All":"Все","Search":"Поиск","Create_restore_point":"Создать точку восстановления","Portable_Downloads_Folder":"Папка для портативных загрузок","Install_msg":"Вы уверены что хотите установить следующие приложения?","Apply_msg":"Вы уверены что хотите применить следующие настройки?","Applying":"Применение...","Please_wait":"Подождите выполняется фоновый процесс.","Last_update":"Последнее обновление","Exit_msg":"Вы уверены что хотите закрыть программу? Все установки будут прерваны.","Happy_birthday":"С Днем Рождения меня!","My_playlist":"Это мой день рождения и мой плейлист ♪","Empty_save_msg":"Выберите хотя бы одно приложение для сохранения.","easter_egg":"Можешь ли ты раскрыть скрытый секрет? Погрузись в исходный код"},"tr":{"name":"Türkçe","Welcome":"Birden fazla programı aynı anda yükleyerek zaman kazanın ve Windows performansınızı artırın. Bu aracı geliştirmek ve daha da iyileştirmek için bize katılın. Ayrıca favori müzik uygulamalarınızı ve ayarlarınızı da ekleyebilirsiniz.","Install":"Yükle","Apply":"Uygula","Downloading":"İndiriliyor...","About":"Hakkında","Third_party":"Üçüncü Taraf","Preferences":"Tercihler","Management":"Yönetim","Apps":"Uygulamalar","Tweaks":"İnce Ayarlar","Settings":"Ayarlar","Save":"Kayıt Et","Restore":"Geri Yükle","Music":"Müzik","On":"Açık ","Off":"Kapalı","Disk_Managment":"Disk Yönetimi","Msconfig":"Sistem Yapılandırması","Environment_Variables":"Ortam Değişkenleri","Task_Manager":"Görev Yöneticisi","Apps_features":"Uygulamalar-Özellikler","Networks":"Ağlar","Services":"Hizmetler","Device_Manager":"Aygıt Yöneticisi","Power_Options":"Güç Seçenekleri","System_Info":"Sistem Bilgisi","Use_system_setting":"Sistem ayarlarını kullan","Create_desktop_shortcut":"MASaüstü kısayolu oluştur","Reset_preferences":"Tercihleri sıfırla","Reopen_itt_again":"Lütfen ITT'yi tekrar açın.","Theme":"Tema","Language":"Dil","MAS":"Microsoft Etkinleştirme Betikleri (MAS)","Win_Office":"Windows / Office ISO İndir","IDM":"IDM Etkinleştirme","Browsers_extensions":"Tarayıcı Eklentileri","All":"Tümü","Search":"Ara","Create_restore_point":"Geri yükleme noktası oluştur","Portable_Downloads_Folder":"Taşınabilir İndirilenler Klasörü","Install_msg":"Aşağıdaki uygulamaları yüklemek istediğinizden emin misiniz?","Apply_msg":"Aşağıdaki ayarları uygulamak istediğinizden emin misiniz?","Applying":"Uygulanıyor...","Please_wait":"Lütfen bekleyin arka planda bir işlem çalışıyor.","Last_update":"SOn güncelleme","Exit_msg":"Programı kapatmak istediğinizden emin misiniz? Herhangi bir kurulum varsa durdurulacak.","Happy_birthday":"Kendime Mutlu Yıllar!","My_playlist":"Benim Doğum Günüm ve Benim Çalma Listem ♪","Empty_save_msg":"Kaydetmek için en az bir uygulama seçin.","easter_egg":"Gizli sırrı keşfedebilir misin? Kaynağa dal"},"zh":{"name":"中文","Welcome":"通过一次安装多个程序节省时间并提升您的Windows性能。加入我们，改进工具，使其更加优秀。","System_Info":"系统信息","Power_Options":"电源选项","Device_Manager":"设备管理器","Services":"服务","Networks":"网络","Apps_features":"应用特性","Task_Manager":"任务管理器","Disk_Managment":"磁盘管理","Msconfig":"系统配置","Environment_Variables":"环境变量","Install":"安装","Apply":"应用","Downloading":"下载中","About":"关于","Third_party":"第三方","Preferences":"偏好","Management":"管理","Apps":"应用","Tweaks":"调整","Settings":"设置","Save":"保存选定应用","Restore":"恢复选定应用","Music":"音乐","On":"开启","Off":"关闭","Reset_preferences":"重置偏好设置","Dark":"深色","Light":"浅色","Use_system_setting":"系统","Create_desktop_shortcut":"创建桌面快捷方式","Reopen_itt_again":"请重新打开ITT。","Theme":"主题","Language":"语言","MAS":"Microsoft 激活脚本 (MAS)","Win_Office":"下载 Windows / Office ISO","IDM":"IDM 激活","Browsers_extensions":"浏览器扩展","All":"都","Create_restore_point":"创建还原点","Portable_Downloads_Folder":"便携下载文件夹","Install_msg":"是否要安装选定的应用","Apply_msg":"是否要应用选定的调整","instAlling":"安装中..","Applying":"应用中..","Please_wait":"请等待，后台有进程在进行中。","Last_update":"最后更新","Exit_msg":"您确定要关闭程序吗？如果有任何安装正在进行，它们将被终止。","Happy_birthday":"生日快乐 Emad!","My_playlist":"这是我的生日和我的播放列表 ♪","easter_egg":"你能发现隐藏的秘密吗？深入源代码，成为第一个发现功能的人，并将其集成到工具中。"}}}

'@ | ConvertFrom-Json
$itt.database.Tweaks = @'
[
  {
    "Name": "Disk cleanup",
    "Description": "Clean temporary files that are not necessary",
    "Category": "Storage",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "irm https://raw.githubusercontent.com/emadadel4/WindowsTweaks/refs/heads/main/Disk%20cleanup.ps1 | iex"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "System File Checker",
    "Description": "sfc /scannow Use the System File Checker tool to repair missing or corrupted system files",
    "Category": "Fixer",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Add-Log -Message 'This may take a few minutes' -Level 'Info' Chkdsk /scan\r\n sfc /scannow\r\n DISM /Online /Cleanup-Image /Restorehealth\r\n sfc /scannow\r\n"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Restore Classic Context Menu Windows 11",
    "Description": "Restore the old context menu for Windows 11",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Classes\\CLSID\\",
        "Name": "{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}",
        "Type": "String",
        "Value": "",
        "defaultValue": ""
      },
      {
        "Path": "HKCU:\\Software\\Classes\\CLSID\\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\\InprocServer32",
        "Name": "",
        "Type": "String",
        "Value": "",
        "defaultValue": "default"
      }
    ]
  },
  {
    "Name": "Restore All Windows Services to Default",
    "Description": "if you face issues with services, try Restore All Windows Services to Default",
    "Category": "Fixer",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/emadadel4/WindowsTweaks/refs/heads/main/test.bat' -OutFile $env:TEMP\\script.bat \r\n Start-Process -FilePath 'cmd.exe' -ArgumentList '/c %TMP%\\script.bat && del /f /q %TMP%\\script.bat ' -NoNewWindow -Wait "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Super Privacy Disable all Privacy Settings",
    "Description": "Disable Wifi-Sense & Activity History & ActivityFeed All Telemetry & DataCollection & disable various telemetry and annoyances in Edge",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [
      "Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Application Experience\\Microsoft Compatibility Appraiser' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Application Experience\\ProgramDataUpdater' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Autochk\\Proxy' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Customer Experience Improvement Program\\Consolidator' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Customer Experience Improvement Program\\UsbCeip' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\DiskDiagnostic\\Microsoft-Windows-DiskDiagnosticDataCollector' | Out-Null; schtasks /change /TN '\\Microsoft\\Windows\\Customer Experience Improvement Program\\Consolidator' /DISABLE > NUL 2>&1; schtasks /change /TN '\\Microsoft\\Windows\\DiskDiagnostic\\Microsoft-Windows-DiskDiagnosticDataCollector' /DISABLE > NUL 2>&1; schtasks /change /TN '\\Microsoft\\Windows\\Windows Error Reporting\\QueueReporting' /DISABLE > NUL 2>&1"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\location",
        "Name": "Value",
        "Type": "String",
        "Value": "Deny",
        "defaultValue": "Deny"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Sensor\\Overrides\\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}",
        "Name": "SensorPermissionState",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\lfsvc\\Service\\Configuration",
        "Name": "Status",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\Maps",
        "Name": "AutoUpdateEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System",
        "Name": "EnableActivityFeed",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\Software\\Microsoft\\PolicyManager\\default\\WiFi\\AllowAutoConnectToWiFiSenseHotspots",
        "Name": "Value",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
        "Name": "Disabled",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
        "Name": "Disabled",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "AllowTelemetry",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "ContentDeliveryAllowed",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "OemPreInstalledAppsEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "PreInstalledAppsEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "PreInstalledAppsEverEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SilentInstalledAppsEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SubscribedContent-338387Enabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SubscribedContent-338388Enabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SubscribedContent-338389Enabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SubscribedContent-353698Enabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SystemPaneSuggestionsEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Siuf\\Rules",
        "Name": "NumberOfSIUFInPeriod",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "DoNotShowFeedbackNotifications",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent",
        "Name": "DisableTailoredExperiencesWithDiagnosticData",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\AdvertisingInfo",
        "Name": "DisabledByGroupPolicy",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
        "Name": "Disabled",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DeliveryOptimization\\Config",
        "Name": "DODownloadMode",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Remote Assistance",
        "Name": "fAllowToGetHelp",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\OperationStatusManager",
        "Name": "EnthusiastMode",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "ShowTaskViewButton",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People",
        "Name": "PeopleBand",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "LaunchTo",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\FileSystem",
        "Name": "LongPathsEnabled",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DriverSearching",
        "Name": "SearchOrderConfig",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile",
        "Name": "SystemResponsiveness",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile",
        "Name": "NetworkThrottlingIndex",
        "Value": "4294967295",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Name": "MenuShowDelay",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Name": "AutoEndTasks",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Memory Management",
        "Name": "ClearPageFileAtShutdown",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SYSTEM\\ControlSet001\\Services\\Ndu",
        "Name": "Start",
        "Value": "2",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Control Panel\\Mouse",
        "Name": "MouseHoverTime",
        "Value": "400",
        "Type": "String",
        "defaultValue": "400"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\LanmanServer\\Parameters",
        "Name": "IRPStackSize",
        "Value": "30",
        "Type": "DWord",
        "defaultValue": "20"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Feeds",
        "Name": "EnableFeeds",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Feeds",
        "Name": "ShellFeedsTaskbarViewMode",
        "Value": "2",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "HideSCAMeetNow",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\UserProfileEngagement",
        "Name": "ScoobeSystemSettingEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Feeds",
        "Name": "EnableFeeds",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "ConnectedSearchPrivacy",
        "Value": "3",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer",
        "Name": "DisableSearchHistory",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "AllowSearchToUseLocation",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "EnableDynamicContentInWSB",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "DisableWebSearch",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer",
        "Name": "DisableSearchBoxSuggestions",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "PreventUnwantedAddIns",
        "Value": " ",
        "Type": "String",
        "defaultValue": " "
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "PreventRemoteQueries",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "AlwaysUseAutoLangDetection",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "AllowIndexingEncryptedStoresOrItems",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },  
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "DisableSearchBoxSuggestions",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },  
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "CortanaInAmbientMode",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },  
      {
        "Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "BingSearchEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },  
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "ShowCortanaButton",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },  
      {
        "Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "CanCortanaBeEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },  
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "CanCortanaBeEnabled",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },  
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "ConnectedSearchUseWebOverMeteredConnections",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },  
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "AllowCortanaAboveLock",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },  
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\SearchSettings",
        "Name": "IsDynamicSearchBoxEnabled",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },  
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\PolicyManager\\default\\Experience\\AllowCortana",
        "Name": "value",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },  
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "AllowSearchToUseLocation",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Speech_OneCore\\Preferences",
        "Name": "ModelDownloadAllowed",
        "Value": "0",
        "Type": "DWord",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\SearchSettings",
        "Name": "IsDeviceSearchHistoryEnabled",
        "Value": "1",
        "Type": "DWord",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Speech_OneCore\\Preferences",
        "Name": "VoiceActivationOn",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Speech_OneCore\\Preferences",
        "Name": "VoiceActivationEnableAboveLockscreen",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\OOBE",
        "Name": "DisableVoice",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "AllowCortana",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "DeviceHistoryEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "HistoryViewEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\Software\\Microsoft\\Speech_OneCore\\Preferences",
        "Name": "VoiceActivationDefaultOn",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "CortanaEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "CortanaEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\SearchSettings",
        "Name": "IsMSACloudSearchEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\SearchSettings",
        "Name": "IsAADCloudSearchEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
        "Name": "AllowCloudSearch",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "VoiceShortcut",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "CortanaConsent",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "AllowDesktopAnalyticsProcessing",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "AllowDeviceNameInTelemetry",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "MicrosoftEdgeDataOptIn",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "AllowWUfBCloudProcessing",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "AllowUpdateComplianceProcessing",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "AllowCommercialDataPipeline",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\Software\\Policies\\Microsoft\\SQMClient\\Windows",
        "Name": "CEIPEnable",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\DataCollection",
        "Name": "AllowTelemetry",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "AllowTelemetry",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DataCollection",
        "Name": "DisableOneSettingsDownloads",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\CurrentVersion\\Software Protection Platform",
        "Name": "NoGenTicket",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting",
        "Name": "Disabled",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
        "Name": "Disabled",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKLM:\\Software\\Microsoft\\Windows\\Windows Error Reporting\\Consent",
        "Name": "DefaultConsent",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\Software\\Microsoft\\Windows\\Windows Error Reporting\\Consent",
        "Name": "DefaultOverrideBehavior",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKLM:\\Software\\Microsoft\\Windows\\Windows Error Reporting",
        "Name": "DontSendAdditionalData",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKLM:\\Software\\Microsoft\\Windows\\Windows Error Reporting",
        "Name": "LoggingDisabled",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "ContentDeliveryAllowed",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "OemPreInstalledAppsEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "PreInstalledAppsEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "PreInstalledAppsEverEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SilentInstalledAppsEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SystemPaneSuggestionsEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\SystemSettings\\AccountNotifications",
        "Name": "EnableAccountNotifications",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\SystemSettings\\AccountNotifications",
        "Name": "EnableAccountNotifications",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Notifications\\Settings",
        "Name": "NOC_GLOBAL_SETTING_TOASTS_ENABLED",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\EdgeUI",
        "Name": "DisableMFUTracking",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EdgeUI",
        "Name": "DisableMFUTracking",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKCU:\\Control Panel\\International\\User Profile",
        "Name": "HttpAcceptLanguageOptOut",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System",
        "Name": "PublishUserActivities",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Personalization",
        "Name": "NoLockScreenCamera",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\location",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\webcam",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\microphone",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\documentsLibrary",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\picturesLibrary",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\videosLibrary",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\broadFileSystemAccess",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\userAccountInformation",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\contacts",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\phoneCallHistory",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\chat",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\email",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\userDataTasks",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\appDiagnostics",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Speech_OneCore\\Settings\\VoiceActivation\\UserPreferenceForAllApps",
        "Name": "AgentActivationEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\AppPrivacy",
        "Name": "LetAppsAccessPhone",
        "Value": "2",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\AppPrivacy",
        "Name": "LetAppsAccessPhone_UserInControlOfTheseApps",
        "Value": "",
        "Type": "REG_MULTI_SZ",
        "DefaultValue": ""
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\AppPrivacy",
        "Name": "LetAppsAccessPhone_ForceAllowTheseApps",
        "Value": "",
        "Type": "REG_MULTI_SZ",
        "DefaultValue": ""
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\AppPrivacy",
        "Name": "LetAppsAccessPhone_ForceDenyTheseApps",
        "Value": "",
        "Type": "REG_MULTI_SZ",
        "DefaultValue": ""
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DeviceAccess\\Global\\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\appointments",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\activity",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\radios",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "DefaultValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "EdgeEnhanceImagesEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "PersonalizationReportingEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "ShowRecommendationsEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "HideFirstRunExperience",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "UserFeedbackAllowed",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "ConfigureDoNotTrack",
        "Value": "1",
        "Type": "DWord",
        "DefaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "AlternateErrorPagesEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "EdgeCollectionsEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "EdgeFollowEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "EdgeShoppingAssistantEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "MicrosoftEdgeInsiderPromotionEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "ShowMicrosoftRewards",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "WebWidgetAllowed",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "DiagnosticData",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "EdgeAssetDeliveryServiceEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "CryptoWalletEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "WalletDonationEnabled",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      }
    ]
  },
  {
    "Name": "Clean Taskbar",
    "Description": "Disable icons",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Feeds",
        "Name": "ShellFeedsTaskbarViewMode",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "SearchboxTaskbarMode",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "2"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People",
        "Name": "PeopleBand",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "HideSCAMeetNow",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "NoNewsAndInterests",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\PolicyManager\\default\\NewsAndInterests\\AllowNewsAndInterests",
        "Name": "value",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Feeds",
        "Name": "EnableFeeds",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "ShowCortanaButton",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "ShowTaskViewButton",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Remove Microsoft Apps",
    "Description": "Uninstalls pre-installed Microsoft apps like Clipchamp, People etc",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [
      "Microsoft.Copilot",
      "Microsoft.BingNews",
      "Microsoft.WindowsCamera",
      "Microsoft.Getstarted",
      "Microsoft.BingWeather_1.0.6.0_x64__8wekyb3d8bbwe",
      "MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy",
      "Microsoft.GetHelp",
      "Microsoft.AppConnector",
      "Microsoft.BingFinance",
      "Microsoft.BingTranslator",
      "Microsoft.BingSports",
      "MicrosoftCorporationII.MicrosoftFamily",
      "Microsoft.BingHealthAndFitness",
      "Microsoft.BingTravel",
      "Microsoft.MinecraftUWP",
      "PowerAutomate",
      "MicrosoftTeams",
      "Microsoft.Todos",
      "Microsoft.AsyncTextService",
      "Microsoft.GamingServices",
      "Microsoft.BingFoodAndDrink",
      "Microsoft.BingWeather",
      "Microsoft.Messaging",
      "Microsoft.Microsoft3DViewer",
      "Microsoft.3DBuilder",
      "Microsoft.MicrosoftOfficeHub",
      "Microsoft.MicrosoftSolitaireCollection",
      "Microsoft.NetworkSpeedTest",
      "Microsoft.News",
      "Microsoft.549981C3F5F10",
      "Microsoft.Office.Lens",
      "Microsoft.Office.OneNote",
      "Microsoft.Office.Sway",
      "Microsoft.OutlookForWindows",
      "Microsoft.OneConnect",
      "Microsoft.People",
      "Microsoft.Print3D",
      "Microsoft.RemoteDesktop",
      "Microsoft.SkypeApp",
      "Microsoft.StorePurchaseApp",
      "Microsoft.Office.Todo.List",
      "Microsoft.Whiteboard",
      "Microsoft.CommsPhone",
      "Microsoft.windowscommunicationsapps",
      "Microsoft.WindowsFeedbackHub",
      "Microsoft.Wallet",
      "Microsoft.WindowsMaps",
      "Microsoft.YourPhone",
      "Microsoft.WindowsSoundRecorder",
      "Microsoft.Windows.Cortana",
      "Microsoft.ScreenSketch",
      "Microsoft.Windows.DevHome",
      "Microsoft.MixedReality.Portal",
      "Microsoft.MSPaint",
      "Microsoft.Getstarted",
      "Microsoft.ZuneVideo",
      "Microsoft.ZuneMusic",
      "EclipseManager",
      "ActiproSoftwareLLC",
      "AdobeSystemsIncorporated.AdobePhotoshopExpress",
      "Duolingo-LearnLanguagesforFree",
      "PandoraMediaInc",
      "CandyCrush",
      "BubbleWitch3Saga",
      "Wunderlist",
      "Flipboard",
      "Twitter",
      "Facebook",
      "Minecraft",
      "Royal Revolt",
      "Sway",
      "Disney.37853FC22B2CE",
      "disney",
      "Microsoft.549981",
      "Microsoft.MicrosoftStickyNotes",
      "TikTok.TikTok_8wekyb3d8bbwe",
      "TikTok",
      "Microsoft.NetworkSpeedTest"
    ],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "NoStartMenuMorePrograms",
        "Type": "DWord",
        "Value": "2",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "NoStartMenuMorePrograms",
        "Type": "DWord",
        "Value": "2",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Remove Xbox Apps",
    "Description": "Uninstalls pre-installed Xbox apps",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [
      "Microsoft.XboxApp",
      "Microsoft.Xbox.TCUI",
      "Microsoft.XboxGamingOverlay",
      "Microsoft.XboxGameOverlay",
      "Microsoft.XboxIdentityProvider",
      "Microsoft.XboxSpeechToTextOverlay"

    ],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Fix Stutter in games",
    "Description": "Fix Stutter in Games (Disable GameBarPresenceWriter). Windows 10/11",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "irm https://raw.githubusercontent.com/emadadel4/Fix-Stutter-in-Games/main/fix.ps1 | iex "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Enable the Ultimate Performance Power Plan",
    "Description": "This will add the Ultimate Performance power plan, to enable it go to the power options",
    "Category": "Power",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61; Start-Process powercfg.cpl"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Reset the TCP/IP Stack",
    "Description": "If you have an internet issue, reset the network configuration",
    "Category": "Fixer",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "netsh int ip reset"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Setup Auto login",
    "Description": "Setup auto login Windows username",
    "Category": "Other",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "curl.exe -ss \"https://live.sysinternals.com/Autologon.exe\" -o $env:temp\\autologin.exe ; cmd /c $env:temp\\autologin.exe /accepteula"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Disable Xbox Services",
    "Description": "Disables all Xbox Services Game Mode",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Disable-MMAgent -MemoryCompression | Out-Null",
      "\r\n        takeown /f C:\\Windows\\System32\\GameBarPresenceWriter.exe\r\n\r\n        takeown /f C:\\Windows\\System32\\GameBarPresenceWriter.proxy.dll\r\n\r\n        takeown /f C:\\Windows\\System32\\Windows.Gaming.UI.GameBar.dll\r\n\r\n        Start-Sleep -Seconds 1\r\n\r\n\r\n        icacls C:\\Windows\\System32\\GameBarPresenceWriter.exe /grant administrators:F\r\n\r\n        icacls C:\\Windows\\System32\\GameBarPresenceWriter.proxy.dll /grant administrators:F\r\n\r\n        icacls C:\\Windows\\System32\\Windows.Gaming.UI.GameBar.dll /grant administrators:F\r\n\r\n        Start-Sleep -Seconds 1\r\n\r\n\r\n        Rename-Item C:\\Windows\\System32\\GameBarPresenceWriter.exe -NewName GameBarPresenceWriter.exe_backup\r\n\r\n        Rename-Item C:\\Windows\\System32\\GameBarPresenceWriter.proxy.dll -NewName GameBarPresenceWriter.proxy.dll_backup\r\n\r\n        Rename-Item C:\\Windows\\System32\\Windows.Gaming.UI.GameBar.dll -NewName Windows.Gaming.UI.GameBar.dll_backup\r\n\r\n      "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\GameBar",
        "Name": "AutoGameModeEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\GameBar",
        "Name": "AllowAutoGameMode",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\GameBar",
        "Name": "ShowStartupPanel",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_Enabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
        "Name": "AppCaptureEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
        "Name": "UseNexusForGameBarEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
        "Name": "AudioCaptureEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
        "Name": "CursorCaptureEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows\\GameDVR",
        "Name": "AllowgameDVR",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Services\\xbgm",
        "Name": "Start",
        "Type": "DWord",
        "Value": "4",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_FSEBehaviorMode",
        "Type": "DWord",
        "Value": "2",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_HonorUserFSEBehaviorMode",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_FSEBehavior",
        "Type": "DWord",
        "Value": "2",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_EFSEFeatureFlags",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_DSEBehavior",
        "Type": "DWord",
        "Value": "2",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\DirectX\\UserGpuPreferences",
        "Name": "DirectXUserGlobalSettings",
        "Type": "String",
        "Value": "SwapEffectUpgradeEnable=1;",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\DirectX\\GraphicsSettings",
        "Name": "",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\DirectX\\GraphicsSettings",
        "Name": "SwapEffectUpgradeCache",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\SoftwareProtectionPlatform",
        "Name": "InactivityShutdownDelay",
        "Type": "DWord",
        "Value": "4294967295",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Dwm",
        "Name": "OverlayTestMode",
        "Type": "DWord",
        "Value": "5",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile\\Tasks\\Games",
        "Name": "GPU Priority",
        "Type": "DWord",
        "Value": "8",
        "defaultValue": "8"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile\\Tasks\\Games",
        "Name": "Scheduling Category",
        "Type": "String",
        "Value": "High",
        "defaultValue": "High"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile\\Tasks\\Games",
        "Name": "SFIO Priority",
        "Type": "String",
        "Value": "High",
        "defaultValue": "High"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\PriorityControl",
        "Name": "IRQ8Priority",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent",
        "Name": "DisableWindowsConsumerFeatures",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Disable Start Menu Ads",
    "Description": "Start menu Ads and Settings",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\AdvertisingInfo",
        "Name": "Enabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SystemPaneSuggestionsEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
        "Name": "SoftLandingEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "ShowSyncProviderNotifications",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable Windows Web Search",
    "Description": "Web results in search",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "BingSearchEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Turn off background Apps",
    "Description": "Turn off background apps",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\BackgroundAccessApplications",
        "Name": "GlobalUserDisabled",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "BackgroundAppGlobalToggle",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable suggestions on Start Menu",
    "Description": "Suggestions on start menu",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent",
        "Name": "DisableWindowsConsumerFeatures",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Remove Folder Shortcuts From File Explorer",
    "Description": "Documents, Videos, Pictures, Desktop. Shortcuts from File Explorer",
    "Category": "Other",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{088e3905-0323-4b02-9826-5d99428e115f}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{088e3905-0323-4b02-9826-5d99428e115f}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{d3162b92-9365-467a-956b-92703aca08af}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{d3162b92-9365-467a-956b-92703aca08af}",
        "Value": "Remove"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer",
        "Name": "HubMode",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCR:\\CLSID\\{018D5C66-4533-4307-9B53-224DE2ED1FE6}",
        "Name": "System.IsPinnedToNameSpaceTree",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCR:\\Wow6432Node\\CLSID\\{018D5C66-4533-4307-9B53-224DE2ED1FE6}",
        "Name": "System.IsPinnedToNameSpaceTree",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Classes\\CLSID\\{031E4825-7B94-4dc3-B131-E946B44C8DD5}",
        "Name": "System.IsPinnedToNameSpaceTree",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Optimize Windows Services",
    "Description": "(Print Spooler), (Fax), (Diagnostic Policy), (Downloaded Maps Manager), (Windows Error Reporting Service), (Remote Registry) , (Internet Connection Sharing), (Disables Telemetry and Data)",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [
      {
        "Name": "Spooler",
        "StartupType": "Disabled",
        "DefaultType": "Automatic"
      },
      {
        "Name": "Fax",
        "StartupType": "Disabled",
        "DefaultType": "Automatic"
      },
      {
        "Name": "DPS",
        "StartupType": "Disabled",
        "DefaultType": "Automatic"
      },
      {
        "Name": "MapsBroker",
        "StartupType": "Disabled",
        "DefaultType": "Automatic"
      },
      {
        "Name": "WerSvc",
        "StartupType": "Disabled",
        "DefaultType": "Manual"
      },
      {
        "Name": "RemoteRegistry",
        "StartupType": "Disabled",
        "DefaultType": "Disabled"
      },
      {
        "Name": "lmhosts",
        "StartupType": "Disabled",
        "DefaultType": "Manual"
      },
      {
        "Name": "SharedAccess",
        "StartupType": "Disabled",
        "DefaultType": "Manual"
      },
      {
        "Name": "DiagTrack",
        "StartupType": "Disabled",
        "DefaultType": "Manual"
      }
    ],
    "Registry": []
  },
  {
    "Name": "Disable Hibernate",
    "Description": "Allows the system to save the current state of your computer",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "powercfg.exe /hibernate off"
    ],
    "UndoScript": [
      "powercfg.exe /hibernate on"
    ],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Power",
        "Name": "HibernateEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\FlyoutMenuSettings",
        "Name": "ShowHibernateOption",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable OneDrive",
    "Description": "Disabling OneDrive",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [
      "OneDrive",
      "MicrosoftEdge"
    ],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\OneDrive",
        "Name": "DisableFileSyncNGSC",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Run",
        "Name": "OneDrive",
        "Value": "Remove"
      }
    ]
  },
  {
    "Name": "Remove OneDrive",
    "Description": "Removes OneDrive from the system",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "irm https://raw.githubusercontent.com/emadadel4/WindowsTweaks/refs/heads/main/OneDrive-Uninstaller.ps1 | iex"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Remove Microsoft Edge (Not Recommended)",
    "Description": "Removes Edge from the system",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "irm https://raw.githubusercontent.com/emadadel4/WindowsTweaks/refs/heads/main/Edge-Remover.ps1 | iex"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Activate Windows Classic Photo Viewer",
    "Description": "Classic Photo Viewer",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".jpg",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".jpeg",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".png",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".bmp",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": ".gif",
        "Type": "String",
        "Value": "PhotoViewer.FileAssoc.Tiff",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": "ApplicationIcon",
        "Type": "String",
        "Value": "C:\\Program Files (x86)\\Windows Photo Viewer\\photoviewer.dll",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
        "Name": "ApplicationName",
        "Type": "String",
        "Value": "Windows Photo Viewer",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Remove Copilot in Windows 11",
    "Description": "AI assistance",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\WindowsCopilot",
        "Name": "TurnOffWindowsCopilot",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsCopilot",
        "Name": "TurnOffWindowsCopilot",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "HubsSidebarEnabled",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\Explorer",
        "Name": "DisableSearchBoxSuggestions",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Explorer",
        "Name": "DisableSearchBoxSuggestions",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Disable Recall Snapshots in Windows 11 24H",
    "Description": "Recall is an upcoming preview experience exclusive to Copilot+",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\WindowsAI",
        "Name": "DisableAIDataAnalysis",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsAI",
        "Name": "DisableAIDataAnalysis",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Delete Thumbnail Cache",
    "Description": "Removing the stored image thumbnails",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Remove-Item \"$env:LocalAppData\\Microsoft\\Windows\\Explorer\\thumbcache*\" -Force -Recurse"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Classic Volume Control",
    "Description": "The old volume control",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\MTCUVC",
        "Name": "EnableMtcUvc",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable Toggle Key Sounds",
    "Description": "Toggle key sounds are audio cues that play when you press the Caps Lock, Num Lock, or Scroll Lock keys",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Control Panel\\Accessibility\\ToggleKeys",
        "Name": "Flags",
        "Type": "String",
        "Value": "58",
        "defaultValue": "62"
      }
    ]
  },
  {
    "Name": "Disable Homegroup",
    "Description": "HomeGroup is a passwordprotected home networking service that lets you share your stuff with other PCs",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [
      {
        "Name": "HomeGroupListener",
        "StartupType": "Manual ",
        "DefaultType": "Automatic"
      },
      {
        "Name": "HomeGroupProvider",
        "StartupType": "Manual ",
        "DefaultType": "Automatic"
      }
    ],
    "Registry": []
  },
  {
    "Name": "Remove Home and Gallery from explorer in Windows 11",
    "Description": "Home and Gallery from explorer and sets This PC as default",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "1",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "1"
      },
      {
        "Path": "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Desktop\\NameSpace\\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}",
        "Value": "Remove"
      },
      {
        "Path": "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Desktop\\NameSpace\\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}",
        "Value": "Remove"
      }
    ]
  },
  {
    "Name": "Disable Wifi Sense",
    "Description": "Service that phones home all nearby scanned wifi networks and your location",
    "Category": "Protection",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\PolicyManager\\default\\WiFi\\AllowWiFiHotSpotReporting",
        "Name": "value",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\PolicyManager\\default\\WiFi\\AllowAutoConnectToWiFiSenseHotspots",
        "Name": "value",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\WcmSvc\\wifinetworkmanager\\config",
        "Name": "AutoConnectAllowedOEM",
        "Value": "0",
        "Type": "DWord",
        "DefaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable Autoplay and Autorun",
    "Description": "Autoplay in prevents the automatic launch of media or applications when a removable device, such as a USB drive or CD",
    "Category": "Protection",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\AutoplayHandlers",
        "Name": "DisableAutoplay",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "NoDriveTypeAutoRun",
        "Type": "DWord",
        "Value": "255",
        "defaultValue": "255"
      }
    ]
  },
  {
    "Name": "Disable SMB Server",
    "Description": "SMB Server enables file and printer sharing over a network, allowing access to resources on remote computers",
    "Category": "Protection",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force; Set-SmbServerConfiguration -EnableSMB2Protocol $false -Force"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Set current network profile to public",
    "Description": "Deny file sharing, device discovery",
    "Category": "Protection",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Set-NetConnectionProfile -NetworkCategory Public"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Enable F8 boot menu options",
    "Description": "Enable F8 boot menu options",
    "Category": "BIOS",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "bcdedit /set bootmenupolicy Standard | Out-Null"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Disable display and sleep mode timeouts",
    "Description": "If you frequently use your device, disable this",
    "Category": "Power",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "\r\n        powercfg /X monitor-timeout-ac 0\r\n        powercfg /X monitor-timeout-dc 0\r\n        powercfg /X standby-timeout-ac 0\r\n        powercfg /X standby-timeout-dc 0\r\n      "
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Set Wallpaper desktop Quality to 100%",
    "Description": "Set Wallpaper desktop Quality",
    "Category": "Personalization",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Control\\CrashControl",
        "Name": "DisplayParameters",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Disable Windows Transparency",
    "Description": "Disableing improve performance",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize",
        "Name": "EnableTransparency",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Disable scheduled defragmentation task",
    "Description": "Optimizes disk performance",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Defrag\\ScheduledDefrag' | Out-Null"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Enable NET 3.5",
    "Description": "Some old games and applications require .NET Framework 3.5",
    "Category": "Classic",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "DISM /Online /Enable-Feature /FeatureName:NetFx3 /All"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Super Performance",
    "Description": "Disabled all windows effects. You may need to log out and back in for changes to take effect. You can reset to default settings in Settings Tab",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "defaultValue": "1",
        "Type": "String",
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Value": "0",
        "Name": "DragFullWindows"
      },
      {
        "defaultValue": "1",
        "Type": "String",
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Value": "200",
        "Name": "MenuShowDelay"
      },
      {
        "defaultValue": "1",
        "Type": "String",
        "Path": "HKCU:\\Control Panel\\Desktop\\WindowMetrics",
        "Value": "0",
        "Name": "MinAnimate"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Control Panel\\Keyboard",
        "Value": "0",
        "Name": "KeyboardDelay"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "ListviewAlphaSelect"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "ListviewShadow"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "TaskbarAnimations"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\VisualEffects",
        "Value": "2",
        "Name": "VisualFXSetting"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\DWM",
        "Value": "0",
        "Name": "EnableAeroPeek"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "TaskbarMn"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "TaskbarDa"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Value": "0",
        "Name": "ShowTaskViewButton"
      },
      {
        "defaultValue": "1",
        "Type": "DWord",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Value": "0",
        "Name": "SearchboxTaskbarMode"
      }
    ]
  },
  {
    "Name": "Remove Widgets from Taskbar in Windows 11",
    "Description": "Widgets are one of the new user interface elements in Windows 11",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [
      "Install-Winget \r\n winget uninstall 'windows web experience pack' --silent"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Name": "TaskbarDa",
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\TaskbarDeveloperSettings",
        "defaultValue": "1",
        "Value": "0",
        "Type": "DWord"
      }
    ]
  },
  {
    "Name": "Unknown",
    "Description": "Rename Computer name and Username to Unknown. The changes will take effect after you restart the computer",
    "Category": "Privacy",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Rename-Computer -NewName 'Unknown'",
      "$currentUsername = $env:USERNAME; Rename-LocalUser -Name $currentUsername -NewName 'Unknown'"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Fix Arabic encoding",
    "Description": "Fix issues related to strange symbols appearing in Arabic text",
    "Category": "Fixer",
    "Check": "false",
    "Refresh": "false",
    "Script": [
      "Set-WinSystemLocale -SystemLocale 'ar-EG'"
    ],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": []
  },
  {
    "Name": "Restore Default File Type Associations",
    "Description": "Restoring default apps for file type associations resets Windows settings, allowing the system to select the appropriate programs by default",
    "Category": "Fixer",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\FileExts",
        "Value": "Remove"
      }
    ]
  },
  {
    "Name": "Limit Defender CPU Usage",
    "Description": "Limits Defender CPU maximum usage at 25% instead of default 50%",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "true",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Scan",
        "Name": "AvgCPULoadFactor",
        "Type": "DWord",
        "Value": "25",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Optimizing GPU scheduling",
    "Description": "Disables Hardware-Accelerated GPU Scheduling, which may improve performance",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\CurrentControlSet\\Control\\GraphicsDrivers",
        "Name": "HwSchMode",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Disable Fullscreen Optimizations",
    "Description": "Fullscreen Optimizations, which may improve performance",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKCU:\\System\\GameConfigStore",
        "Name": "GameDVR_DXGIHonorFSEWindowsCompatible",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Optimize Network",
    "Description": "Optimize network performance",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters",
        "Name": "TcpAckFrequency",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters",
        "Name": "TCPNoDelay",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Enable system cache",
    "Description": "Enabling large system cache can improve performance for certain workloads but may affect system stability",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Memory Management",
        "Name": "LargeSystemCache",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      }
    ]
  },
  {
    "Name": "Optimizing NVIDIA GPU settings",
    "Description": "Optimize NVIDIA GPU settings ",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\Software\\NVIDIA Corporation\\Global\\NvCplApi\\Policies",
        "Name": "PowerMizerEnable",
        "Type": "DWord",
        "Value": "1",
        "defaultValue": "0"
      },
      {
        "Path": "HKLM:\\Software\\NVIDIA Corporation\\Global\\NvCplApi\\Policies",
        "Name": "PowerMizerLevel",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      },
      {
        "Path": "HKLM:\\Software\\NVIDIA Corporation\\Global\\NvCplApi\\Policies",
        "Name": "PowerMizerLevelAC",
        "Type": "DWord",
        "Value": "0",
        "defaultValue": "1"
      }
    ]
  },
  {
    "Name": "Enable Faster Shutdown",
    "Description": "Optimize NVIDIA GPU settings ",
    "Category": "Performance",
    "Check": "false",
    "Refresh": "false",
    "Script": [],
    "UndoScript": [],
    "ScheduledTask": [],
    "AppxPackage": [],
    "Services": [],
    "Registry": [
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Control",
        "Name": "WaitToKillServiceTimeout",
        "Type": "String",
        "Value": "2000",
        "defaultValue": "100"
      },
      {
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Name": "WaitToKillAppTimeout",
        "Type": "String",
        "Value": "2000",
        "defaultValue": "100"
      },
      {
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Name": "HungAppTimeout",
        "Type": "String",
        "Value": "2000 ",
        "defaultValue": "100"
      }
    ]
  }
]
'@ | ConvertFrom-Json
#===========================================================================
#endregion End Database /APPS/TWEEAKS/Quotes/OST/Settings
#===========================================================================
#===========================================================================
#region Begin Main Functions
#===========================================================================
function Invoke-Button {

    <#
        .SYNOPSIS
            Handles various button actions and commands based on the specified action parameter.
        .DESCRIPTION
            The `Invoke-Button` function executes different actions depending on the input parameter. It manages operations such as installing apps.
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
            # debug start
                Debug-Message $action
            # debug end
        }
        "applyBtn" {
            Invoke-Apply
            # debug start
                Debug-Message $action
            # debug end
        }
        "$($itt.CurrentCategory)" {
            FilterByCat($itt["window"].FindName($itt.CurrentCategory).SelectedItem.Content)
            # debug start
                Debug-Message $action
            # debug end

        }
        "searchInput" {
            Search
            # debug start
                Debug-Message $action
            # debug end
        }
        # Menu items
        "systemlang" {
            Set-Language -lang "default"
            # debug start
                Debug-Message $action
            # debug end
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
            "ga" {
                Set-Language -lang "ga"
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
            # debug start
                Debug-Message $action
            # debug end
        }
        "load" {
            Get-file
            # debug start
                Debug-Message $action
            # debug end
        }
        # Device Management
        "deviceManager" {
            Start-Process devmgmt.msc 
            # debug start
                Debug-Message $action
            # debug end
        }
        "appsfeatures" {
            Start-Process appwiz.cpl 
            # debug start
                Debug-Message $action
            # debug end
        }
        "sysinfo" {
            Start-Process msinfo32.exe
            Start-Process dxdiag.exe 
            # debug start
                Debug-Message $action
            # debug end
        }
        "poweroption" {
            Start-Process powercfg.cpl 
            # debug start
                Debug-Message $action
            # debug end
        }
        "services" {
            Start-Process services.msc 
            # debug start
                Debug-Message $action
            # debug end
        }
        "network" {
            Start-Process ncpa.cpl
            # debug start
                Debug-Message $action
            # debug end

        }
        "taskmgr" {
            Start-Process taskmgr.exe
            # debug start
                Debug-Message $action
            # debug end
        }
        "diskmgmt" {
            Start-Process diskmgmt.msc
            # debug start
                Debug-Message $action
            # debug end
        }
        "msconfig" {
            Start-Process msconfig.exe
            # debug start
                Debug-Message $action
            # debug end
        }
        "ev" {
            rundll32 sysdm.cpl,EditEnvironmentVariables
        }
        "spp" {
            systemPropertiesProtection
        }
        "systheme" {
            SwitchToSystem 
            # debug start
                Debug-Message $action
            # debug end
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
            # debug start
                Debug-Message $action
            # debug end
        }
        # itt Dir
        "itt" {
            Start-Process explorer.exe $env:ProgramData\itt
            # debug start
                Debug-Message $action
            # debug end

        }
        # restore point
        "restorepoint" {
            ITT-ScriptBlock -ScriptBlock{CreateRestorePoint}
            # debug start
                Debug-Message $action
            # debug end
        }
        # Music
        "moff" {
            Manage-Music -action "SetVolume" -volume 0 
            # debug start
                Debug-Message $action
            # debug end
        }
        "mon" {
            Manage-Music -action "SetVolume" -volume 100 
            # debug start
                Debug-Message $action
            # debug end
        }
        # Mirror Links
        "unhook" {
            Start-Process "https://unhook.app/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "efy" {
            Start-Process "https://www.mrfdev.com/enhancer-for-youtube" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "uBlock" {
            Start-Process "https://ublockorigin.com/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "mas" {
            Add-Log -Message "Microsoft Activation Scripts (MAS)" -Level "info"
            ITT-ScriptBlock -ScriptBlock {irm https://get.activated.win | iex}
            # debug start
                Debug-Message $action
            # debug end
        }
        "idm" {
            Add-Log -Message "Running IDM Activation..." -Level "info"
            ITT-ScriptBlock -ScriptBlock {curl.exe -L -o $env:TEMP\\IDM_Trial_Reset.exe "https://github.com/itt-co/itt-packages/raw/refs/heads/main/automation/idm-trial-reset/IDM%20Trial%20Reset.exe"; cmd /c "$env:TEMP\\IDM_Trial_Reset.exe"}
            # debug start
                Debug-Message $action
            # debug end
        }
        "winoffice" {
            Start-Process "https://massgrave.dev/genuine-installation-media" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "sordum" {
            Start-Process "https://www.sordum.org/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "majorgeeks" {
            Start-Process "https://www.majorgeeks.com/" 
            # debug start
                Debug-Message $action
            # debug end
        }
        "techpowerup" {
            Start-Process "https://www.techpowerup.com/download/"
            # debug start
                Debug-Message $action
            # debug end
        }
        # Other actions
        "ittshortcut" {
            ITTShortcut $action
            # debug start
                Debug-Message $action
            # debug end
        }
        "dev" {
            About
            # debug start
                Debug-Message $action
            # debug end
        }
        "shelltube"{
            Start-Process -FilePath "powershell" -ArgumentList "irm https://github.com/emadadel4/shelltube/releases/latest/download/st.ps1 | iex"
            # debug start
                Debug-Message $action
            # debug end
        }
        "fmhy"{
            Start-Process ("https://fmhy.net/")
            # debug start
                Debug-Message $action
            # debug end
        }
        "rapidos"{
            Start-Process ("https://github.com/rapid-community/RapidOS")
            # debug start
                Debug-Message $action
            # debug end
        }
        "asustool"{
            Start-Process ("https://github.com/codecrafting-io/asus-setup-tool")
            # debug start
                Debug-Message $action
            # debug end
        }
        "webtor"{
            Start-Process ("https://webtor.io/")
            # debug start
                Debug-Message $action
            # debug end
        }
        "spotifydown"{
            Start-Process ("https://spotidownloader.com/")
            # debug start
                Debug-Message $action
            # debug end
        }
        "taps"{
            ChangeTap
            # debug start
                Debug-Message $action
            # debug end
        }
        Default {
            Write-Host "Unknown action: $action"
        }
    }
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
        
        Add-Log -Message "Creating Restore point..." -Level "INFO"
        Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" -Name "SystemRestorePointCreationFrequency" -Value 0 -Type DWord -Force
        powershell.exe -Command {

            $Date = Get-Date -Format "yyyyMMdd-hhmmss-tt"
            $RestorePointName = "ITT-$Date"
            Enable-ComputerRestore -Drive $env:SystemDrive
            Checkpoint-Computer -Description $RestorePointName -RestorePointType "MODIFY_SETTINGS"
            exit
        }

        Set-ItemProperty -Path $itt.registryPath  -Name "backup" -Value 1 -Force
        Add-Log -Message "Created successfully" -Level "INFO"
    }
    catch {
        Add-Log -Message "Error: $_" -Level "ERROR"
    }
}
function Add-Log {

    <#
        .SYNOPSIS
        Custom Write-Host Display Text with icon and name
    #>

    param ([string]$Message, [string]$Level = "INFO")

    $level = $Level.ToUpper()
    $colorMap = @{ INFO="White"; WARNING="Yellow"; ERROR="Red"; INSTALLED="White"; APPLY="White"; DEBUG="Yellow" }
    $iconMap  = @{ INFO="[+]"; WARNING="[!]"; ERROR="[X]"; DEFAULT=$null; DEBUG="[Debug]"; ITT="[ITT]"; Chocolatey="[Chocolatey]"; Winget="[Winget]" }

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
            Notify -title "$title" -msg "ALL INSTALLATIONS COMPLETED SUCCESSFULLY." -icon "Info" -time 30000
        }
        "TweaksListView" {
            UpdateUI -Button "ApplyBtn" -Content "Apply" -Width "140"
            Add-Log -Message "Done." -Level "info"
            Notify -title "$title" -msg "ALL TWEAKS HAVE BEEN APPLIED SUCCESSFULLY." -icon "Info" -time 30000
        }
    }

    # Reset Taskbar Progress
    $itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "None" -value 0.01 -icon "done" })

    # Uncheck all items in ListView
    $itt.$ListView.Dispatcher.Invoke([Action] {
            # Uncheck all items
            foreach ($item in $itt.$ListView.Items) {
                if ($item.Children.Count -gt 0 -and $item.Children[0].Children.Count -gt 0) {
                    $item.Children[0].Children[0].IsChecked = $false
                }
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
                return $item.Children[0].Children[0].IsChecked -eq $true
            }
        }
        Default {

            $collectionView.Filter = {
                param ($item)

                # Uncheck all checkboxes
                $item.Children[0].Children[0].IsChecked = $false
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
    #>
    
    param ([string]$Mode)

    switch ($Mode) {
        "Apps" {

            $items = @()  

            $itt["window"].FindName("appslist").Items.Items | Where-Object { $_.IsChecked } | ForEach-Object {

                $tag = $_.Tag
                $tagParts = $tag -split " \| "
                $choco = $tagParts[0]
                $winget = $tagParts[1]
                $itt = $tagParts[2]

                $items += @{
                    Name    = $_.Content
                    Choco   = $choco
                    Winget  = $winget
                    ITT     = $itt
                    # Add a new download method here
                }
            }
        }
        "Tweaks" {

            $items = @()  

            foreach ($item in $itt.TweaksListView.Items) {
                
                $child = $item.Children[0].Children[0]

                if ($tweaksDict.ContainsKey($child.Content) -and $child.IsChecked) {

                    $items += @{

                        Name          = $tweaksDict[$child.Content].Name
                        Registry      = $tweaksDict[$child.Content].Registry
                        Services      = $tweaksDict[$child.Content].Services
                        ScheduledTask = $tweaksDict[$child.Content].ScheduledTask
                        AppxPackage   = $tweaksDict[$child.Content].AppxPackage
                        Script        = $tweaksDict[$child.Content].Script
                        UndoScript    = $tweaksDict[$child.Content].UndoScript
                        Refresh       = $tweaksDict[$child.Content].Refresh
                        # Add a new tweak method here
                    }
                }
            }
        }
    }
    return $items
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
    if ($ToggleSwitch -eq "WSL") {
        $WSL = Get-WindowsOptionalFeature -Online -FeatureName "Microsoft-Windows-Subsystem-Linux"
        if ($WSL.State -eq "Enabled") {
            return $true
        } 
        else {
            return $false
        }
    }   

    # HyperV
    if ($ToggleSwitch -eq "HyperV") {
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

        .DESCRIPTION
        The Install-App function automates the installation of applications using Chocolatey and Winget. 
        It first attempts to install the application with Chocolatey if provided. If Chocolatey is not 
        available or fails, it falls back to Winget for installation. The function also logs the 
        installation attempts, successes, and failures.

        .EXAMPLE
        Install-App -Name "Google Chrome" -Choco "googlechrome" -Winget "Google.Chrome"
    #>

    param ([string]$Name,[string]$Choco,[string]$Winget,[string]$ITT)

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
            Add-Log -Message "Installation Failed for ($Name). Report the issue in ITT repository." -Level "$Source"
        }
        else {
            Add-Log -Message "Successfully Installed ($Name)" -Level "$Source"
        }
    }

    # Common Winget Arguments
    $wingetArgs = "install --id $Winget --silent --accept-source-agreements --accept-package-agreements --force"
    $chocoArgs = "install $Choco --confirm --acceptlicense -q --ignore-http-cache --limit-output --allowemptychecksumsecure --ignorechecksum --allowemptychecksum --usepackagecodes --ignoredetectedreboot --ignore-checksums --ignore-reboot-requests"
    $ittArgs = "install $ITT -y"

    # TODO: If Chocolatey is 'none', use Winget
    if ($Choco -eq "na" -and $Winget -eq "na" -and $itt -ne "na") {

        Install-ITTAChoco
        Add-Log -Message "Attempting to install $Name." -Level "ITT"
        $ITTResult = Install-AppWithInstaller "itt" $ittArgs
        Log $ITTResult "itt"
    }
    else 
    {
        # TODO: if choco is 'none' and winget is not 'none', use winget
        if ($Choco -eq "na" -and $Winget -ne "na") 
        {
            Install-Winget
            Add-Log -Message "Attempting to install $Name." -Level "Winget"
            Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
            $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
            Log $wingetResult "Winget"
        }
        else 
        {
            # TODO: If choco is not 'none' and winget is not 'none', use choco first and fallback to winget
            if ($Choco -ne "na" -or $Winget -ne "na") 
            {
                Install-ITTAChoco
                Add-Log -Message "Attempting to install $Name." -Level "Chocolatey"
                $chocoResult = Install-AppWithInstaller "choco" $chocoArgs

                if ($chocoResult -ne 0) {
                    Install-Winget
                    Add-Log -Message "installation failed, Falling back to Winget." -Level "Chocolatey"
                    Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
                    $wingetResult = Install-AppWithInstaller "winget" $wingetArgs
                    Log $wingetResult "Winget"
                }else {
                    Log $chocoResult "Chocolatey"
                }
            }else {
                Add-Log -Message "Package not found in any package manager" -Level "ERROR"
            }
        }
    }
}
function Install-ITTAChoco {

    # Installing Choco package manager if not exist
    if (-not (Get-Command choco -ErrorAction SilentlyContinue))
    {
        Add-Log -Message "Checking dependencies This won't take a minute..." -Level "INFO"
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) *> $null
    }

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
    # Check if explorer is not running and start it if needed
    Add-Log -Message "Restart explorer." -Level "info"
    Stop-Process -Name explorer -Force
    Start-Sleep -Seconds 1
    if (-not (Get-Process -Name explorer -ErrorAction SilentlyContinue)) {
        Start-Process explorer.exe -Verb RunAs
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
function Reset-Preferences {

    <#
        .SYNOPSIS
        Resets user preferences for music volume and popup window settings.
    #>

    Set-ItemProperty -Path $itt.registryPath  -Name "PopupWindow" -Value 0 -Force
    Set-ItemProperty -Path $itt.registryPath  -Name "Music" -Value 0 -Force
    SwitchToSystem
    System-Default
    Message -key "Reopen_itt_again" -icon "Information" -action "OK"
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

                if ($FileContent.Name -contains $item.Children[0].Children[0].Content) { return $item.Children[0].Children[0].IsChecked = $true } else { return $false }
            }
        }
        catch {
            Write-Warning "Failed to load or parse JSON file: $_"
        }
    }

    # Clear search input
    $itt.Search_placeholder.Visibility = "Visible"
    $itt.SearchInput.Text = $null
}

# Save selected items to a JSON file
function Save-File {
    
    $itt['window'].FindName("AppsCategory").SelectedIndex = 0
    Show-Selected -ListView "AppsListView" -Mode "Filter"

    # Collect checked items
    $items = foreach ($item in $itt.AppsListView.Items) {
        
        if ($item.Children[0].Children[0].IsChecked) {
            [PSCustomObject]@{
                Name  = $item.Children[0].Children[0].Content
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
    
    # Clear search input
    $itt.Search_placeholder.Visibility = "Visible"
    $itt.SearchInput.Text = $null
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

        if ($FileContent.Name -contains $item.Children[0].Children[0].Content) { return $item.Children[0].Children[0].IsChecked = $true } else { return $false }
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
                    New-Item -Path $_.Path | Out-Null   
                }
                Add-Log -Message "Optmize $($_.name)..." -Level "info"
                New-ItemProperty -Path $_.Path -Name $_.Name -PropertyType $_.Type -Value $_.Value -Force | Out-Null     
            }else
            {
                if($_.Name -ne $null)
                {
                    # Remove the specific registry value
                    Add-Log -Message "Remove $($_.name) from registry..." -Level "info"
                    Remove-ItemProperty -Path $_.Path -Name $_.Name -Force -ErrorAction SilentlyContinue
                }else{
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

    $UsersCount = "https://ittools-7d9fe-default-rtdb.firebaseio.com/message/message.json"
 
    ITT-ScriptBlock -ArgumentList $Debug $UsersCount -ScriptBlock {
 
        param($Debug, $UsersCount)
        function Telegram {
            param (
                [string]$Message
            )
            try {
                # This only do Devices count
                $BotToken = "7140758327:AAG0vc3zBFSJtViny-H0dXAhY5tCac1A9OI"
                $ChatID = "1299033071"
                # This only do Devices count
                $SendMessageUrl = "https://api.telegram.org/bot$BotToken"
                $PostBody = @{
                    chat_id = $ChatID
                    text    = $Message
                }
                $Response = Invoke-RestMethod -Uri "$SendMessageUrl/sendMessage" -Method Post -Body $PostBody -ContentType "application/x-www-form-urlencoded"
            }
            catch {
                Add-Log -Message "Your internet connection appears to be slow." -Level "WARNING"
            }
        }
 
        function GetCount {
            # Fetch data using GET request
            $response = Invoke-RestMethod -Uri $UsersCount -Method Get
         
            # Output the Users count
            return $response
        }
         
        function PlayMusic {

            $ST = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/OST.json" -Method Get

            # Function to play an audio track
            function PlayAudio($track) {
                $mediaItem = $itt.mediaPlayer.newMedia($track)
                $itt.mediaPlayer.currentPlaylist.appendItem($mediaItem)
                $itt.mediaPlayer.controls.play()

                # debug start
                    # $currentFileName = $itt.mediaPlayer.currentMedia.name
                    # Write-Host "Currently playing: $currentFileName"
                # debug end
            }
            # Shuffle the playlist and create a new playlist
            function GetShuffledTracks {
                switch ($itt.Date.Month, $itt.Date.Day) {
                    { $_ -eq 9, 1 } { return $ST.Favorite | Get-Random -Count $ST.Favorite.Count }
                    { $_ -eq 10, 6 -or $_ -eq 10, 7 } { return $ST.Otobers | Get-Random -Count $ST.Otobers.Count }
                    default { return $ST.Tracks | Get-Random -Count $ST.Tracks.Count }
                }
            }
            # Preload and play the shuffled playlist
            function PlayPreloadedPlaylist {
                # Preload the shuffled playlist
                $shuffledTracks = GetShuffledTracks
                foreach ($track in $shuffledTracks) {
                    PlayAudio -track $track.url
                    # Wait for the track to finish playing
                    while ($itt.mediaPlayer.playState -in @(3, 6)) {
                        Start-Sleep -Milliseconds 100
                    }
                }
            }
            # Play the preloaded playlist
            PlayPreloadedPlaylist
        }
 
        function Quotes {
            function Get-Quotes {
                (Invoke-RestMethod "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/Quotes.json").Quotes | Sort-Object { Get-Random }
            }
            
            function Show-Quote($text, $icon) {
                $itt.Statusbar.Dispatcher.Invoke([Action] { 
                        $itt.Statusbar.Text = "$icon $text"
                    })
            }
        
            Show-Quote $itt.database.locales.Controls.$($itt.Language).welcome "☕"
            Start-Sleep 10
            Show-Quote $itt.database.locales.Controls.$($itt.Language).easter_egg "👁‍🗨"
            Start-Sleep 10
            $iconMap = @{quote = "💬"; info = "📢"; music = "🎵"; Cautton = "⚠"; default = "☕" }
            do {
                foreach ($q in Get-Quotes) {
                    $icon = if ($iconMap.ContainsKey($q.type)) { $iconMap[$q.type] } else { $iconMap.default }
                    $text = "`“$($q.text)`”" + $(if ($q.name) { " ― $($q.name)" } else { "" })
                    Show-Quote $text $icon
                    Start-Sleep 19
                }
            } while ($true)
        }
 
        function UsageCount {

            # Fetch current count from Firebase as a string
            $currentCount = Invoke-RestMethod -Uri $UsersCount -Method Get
        
            # Convert to integer, increment, and convert back to string
            $Runs = ([int]$currentCount + 1).ToString()
        
            # Update the count in Firebase as a string
            Invoke-RestMethod -Uri $UsersCount -Method Put -Body ($Runs | ConvertTo-Json -Compress) -Headers @{ "Content-Type" = "application/json" }
        
            # Output success
            Telegram -Message "Launch from`n$($itt.command)`nUsage`n$($Runs)`n$($itt.Language)"
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
            Write-Host "`n  ITT has been used $(GetCount) times worldwide.`n" -ForegroundColor White
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
        }
            'tweeksTab'   = @{ 
            'installBtn' = 'Hidden'; 
            'applyBtn' = 'Visible'; 
            'CurrentList' = 'tweakslist'; 
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
            #$itt['window'].FindName('AppsCategory').Visibility = $settings['installBtn']
            #$itt['window'].FindName('TwaeksCategory').Visibility = $settings['applyBtn']
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
function Invoke-Install {

    $selectedApps = Get-SelectedItems -Mode "Apps"
    
    Write-Host $selectedApps.Choco
}
function Invoke-Toggle {
    
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
        "WSL" { Invoke-WindowsSandbox $(Get-ToggleStatus WSL) }
        "HyperV" { Invoke-HyperV $(Get-ToggleStatus HyperV) }
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
            Add-Log -Message "HyperV disabled" -Level "info"
            dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V-All /all /norestart
        }
        else {
            Add-Log -Message "HyperV enabled" -Level "info"
            dism.exe /online /disable-feature /featurename:Microsoft-Hyper-V-All /norestart
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
            Add-Log -Message "Sandbox disabled" -Level "info"
            Dism /online /Disable-Feature /FeatureName:"Containers-DisposableClientVM"
        }
        else {
            Add-Log -Message "Sandbox enabled" -Level "info"
            Dism /online /Enable-Feature /FeatureName:"Containers-DisposableClientVM" -All
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
            Add-Log -Message "WSL2 disabled" -Level "info"
            dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /norestart
            dism.exe /online /disable-feature /featurename:VirtualMachinePlatform /norestart
        }
        else {
            Add-Log -Message "WSL2 enabled" -Level "info"
            dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
            dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
        }
    }

    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set WSL2 due to a Security Exception"
    }
}
function About {
    # init child window
    [xml]$about = $AboutWindowXaml
    $childWindowReader = (New-Object System.Xml.XmlNodeReader $about)
    $itt.about = [Windows.Markup.XamlReader]::Load($childWindowReader)
    $itt.about.Add_PreViewKeyDown({ if ($_.Key -eq "Escape") { $itt.about.Close() } })
    # Get main style theme
    $itt['about'].Resources.MergedDictionaries.Clear()
    $itt["about"].Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.Theme))
    # # Set Events on Click
    $itt.about.FindName('ver').Text = "Last update $($itt.lastupdate)"
    $itt.about.FindName("telegram").Add_Click({ Start-Process("https://t.me/emadadel4") })
    $itt.about.FindName("github").Add_Click({ Start-Process("https://github.com/emadadel4/itt") })
    $itt.about.FindName("blog").Add_Click({ Start-Process("https://emadadel4.github.io") })
    $itt.about.FindName("yt").Add_Click({ Start-Process("https://www.youtube.com/@emadadel4") })
    $itt.about.FindName("coffee").Add_Click({ Start-Process("https://buymeacoffee.com/emadadel") })
    # Set data context language
    $itt.about.DataContext = $itt.database.locales.Controls.$($itt.Language)
    # Show window
    $itt.about.ShowDialog() | Out-Null
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
function Search {
    $filter = $itt.searchInput.Text.ToLower() -replace '[^\p{L}\p{N}]', ''
    $treeView = $itt["window"].FindName("appslist")

    # حفظ العناصر الأصلية أول مرة
    if (-not $script:originalItems) {
        $script:originalItems = @()
        foreach ($item in $treeView.Items) {
            $script:originalItems += $item
        }
    }

    $treeView.Items.Clear()

    # لو مفيش فلتر، نرجّع الكل
    if ([string]::IsNullOrWhiteSpace($filter)) {
        foreach ($item in $script:originalItems) {
            $treeView.Items.Add($item)
        }
        return
    }

    foreach ($item in $script:originalItems) {
        $matchedTreeItem = New-Object System.Windows.Controls.TreeViewItem
        $matchedTreeItem.Header = $item.Header
        $matchedTreeItem.IsExpanded = $true

        foreach ($child in $item.Items) {
            if ($child -is [System.Windows.Controls.CheckBox]) {
                $text = $child.Content.ToString().ToLower() -replace '[^\p{L}\p{N}]', ''
                if ($text -eq $filter) {
                    # إنشاء نسخة جديدة من CheckBox
                    $check = New-Object System.Windows.Controls.CheckBox
                    $check.Content = $child.Content
                    $check.IsChecked = $child.IsChecked
                    $matchedTreeItem.Items.Add($check)
                }
            }
        }

        if ($matchedTreeItem.Items.Count -gt 0) {
            $treeView.Items.Add($matchedTreeItem)
        }
    }
}

$KeyEvents = {
    if ($itt.ProcessRunning) { return }

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
                $global:toggleState = -not $global:toggleState
                if ($global:toggleState) { Manage-Music -action "SetVolume" -volume 100 }
                else { Manage-Music -action "SetVolume" -volume 0 }
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
        "F" { if ($modifiers -eq "Ctrl") { $itt.SearchInput.Focus() } }
        "Escape" {
            $itt.SearchInput.MoveFocus([System.Windows.Input.TraversalRequest]::New([System.Windows.Input.FocusNavigationDirection]::Next))
            $itt.SearchInput.Text = $null
            $itt["window"].FindName("search_placeholder").Visibility = "Visible"
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
            Add-Log -Message "This language ($shortCulture) is not supported yet, fallback to English" -Level "Info"
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
        Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value $lang -Force
        $itt["window"].DataContext = $itt.database.locales.Controls.$lang
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
function UpdateUI {
    
    <#
        .SYNOPSIS
        Updates the user interface elements, including a button's width, text, and associated icons.
        .DESCRIPTION
        The `UpdateUI` function is designed to modify various UI components within the application. 
        It updates the width and text of a specified button, changes the text of a related text block, and sets the icon for another text block. 
        This function is typically used to reflect different states of the application, such as during installations or other processes.
    #>

    param([string]$Button,[string]$Content,[string]$Width = "140")
    
    $key = $itt.database.locales.Controls.$($itt.Language).$Content

    $itt['window'].Dispatcher.Invoke([Action]{
        $itt.$Button.Width = $Width
        $itt.$Button.Content = "$key"
    })
}
#===========================================================================
#endregion End Main Functions
#===========================================================================
#===========================================================================
#region Begin WPF Main Window
#===========================================================================
$MainWindowXaml = '<!--Main Window-->
<Window
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
x:Name="Window" 
Title="Install Tweaks Tool" 
WindowStartupLocation = "CenterScreen" 
Background="{DynamicResource PrimaryBackgroundColor}"
Height="700" Width="1000" 
MinHeight="600" 
MinWidth="900" 
Topmost="False"  
ShowInTaskbar = "True" 
TextOptions.TextFormattingMode="Ideal"
TextOptions.TextRenderingMode="Auto"
FontFamily="arial"
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
        <Setter Property="BorderThickness" Value="1"/>
        <Setter Property="Padding" Value="10,5"/>
        <Setter Property="FontSize" Value="16"/>
        <Setter Property="Cursor" Value="Hand"/>
        <Setter Property="Template">
        <Setter.Value>
            <ControlTemplate TargetType="Button">
                    <Grid>
                        <Border Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="0" CornerRadius="25">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                    </Grid>
            </ControlTemplate>
            </Setter.Value>
        </Setter>
        <Style.Triggers>
            <Trigger Property="IsMouseOver" Value="True">
                <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                <Setter Property="Foreground" Value="{DynamicResource HighlightColor}"/>
                <Setter Property="BorderBrush" Value="{DynamicResource HighlightColor}"/>
            </Trigger>
            <Trigger Property="IsPressed" Value="True">
                <Setter Property="Background" Value="{DynamicResource PressedButtonColor}"/>
            </Trigger>
        </Style.Triggers>
    </Style>
<!--End Button Style-->

<!--ListViewItem Style-->
    <Style TargetType="ListViewItem">
        <Setter Property="Margin" Value="0 5 0 0"/>
        <Setter Property="BorderThickness" Value="0.5"/>
        <Setter Property="BorderBrush" Value="DarkGray"/>
        <Setter Property="Padding" Value="0"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="ListViewItem">
                    <Border Name="bg" 
                            CornerRadius="6"
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
            </Trigger>
            <Trigger Property="ItemsControl.AlternationIndex" Value="1">
                <Setter Property="Background" Value="{DynamicResource itemColor2}" />
            </Trigger>
        </Style.Triggers>
    </Style>
<!--End ListViewItem Style-->

<!--CheckBox Style-->
    <Style TargetType="CheckBox">
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="Margin" Value="0"/>
        <Setter Property="Padding" Value="6"/>
        <Setter Property="BorderThickness" Value="1.5"/>
        <Setter Property="BorderBrush" Value="DarkGray"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="CheckBox">
                    <StackPanel Orientation="Horizontal">
                        <!-- Checkbox box -->
                        <Border Name="CheckRadius" Width="16" Height="16" BorderBrush="{TemplateBinding BorderBrush}" CornerRadius="2" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}">
                            <!-- Checkmark arrow inside the box -->
                            <Path x:Name="CheckMark" Width="13" Height="13" Stretch="Uniform" Stroke="WhiteSmoke" StrokeThickness="2.6" Data="M 0 5 L 4 8 L 10 0" Visibility="Collapsed"/>
                        </Border>
                        <!-- Content beside the checkbox -->
                        <ContentPresenter Margin="8 0 0 0" VerticalAlignment="Center"/>
                    </StackPanel>
                    <ControlTemplate.Triggers>
                        <Trigger Property="IsChecked" Value="True">
                            <Setter TargetName="CheckMark" Property="Visibility" Value="Visible"/>
                            <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                            <Setter Property="BorderBrush" Value="{DynamicResource HighlightColor}"/>
                        </Trigger>
                        <Trigger Property="IsChecked" Value="False">
                            <Setter Property="Background" Value="White"/>
                        </Trigger>
                        <Trigger Property="IsMouseOver" Value="True">
                            <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                            <Setter Property="BorderBrush" Value="{DynamicResource HighlightColor}"/>
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End CheckBox Style-->

<!--SearchBox Style-->
    <Style x:Key="SearchBox" TargetType="TextBox">
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorPrimary}"/>
        <Setter Property="BorderBrush" Value="{DynamicResource BorderBrush}"/>
        <Setter Property="BorderThickness" Value="0"/>
        <Setter Property="Padding" Value="8"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="TextBox">
                    <Border Margin="0" 
                            Background="{TemplateBinding Background}" 
                            BorderBrush="{TemplateBinding BorderBrush}" 
                            BorderThickness="{TemplateBinding BorderThickness}" 
                            CornerRadius="15">
                        <ScrollViewer x:Name="PART_ContentHost" 
                                    Background="Transparent"/>
                    </Border>
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
        <Setter Property="Foreground" Value="{DynamicResource TextColorPrimary}"/>
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
        <Setter Property="Margin" Value="1"/>
        <Setter Property="Padding" Value="0"/>
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
    <Style TargetType="TabItem">
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
                            <Setter TargetName="Border" Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
                            <Setter Property="Foreground" Value="{DynamicResource HighlightColor}" />
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
    <Style TargetType="ComboBox">
        <Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="BorderBrush" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
        <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
        <Setter Property="BorderThickness" Value="1"/>
        <Setter Property="Padding" Value="6,3"/>
        <Setter Property="HorizontalContentAlignment" Value="Left"/>
        <Setter Property="VerticalContentAlignment" Value="Center"/>
        <Setter Property="ScrollViewer.HorizontalScrollBarVisibility" Value="Disabled"/>
        <Setter Property="ScrollViewer.VerticalScrollBarVisibility" Value="Auto"/>
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="ComboBox">
                    <Grid>
                        <ToggleButton 
                            Name="ToggleButton"
                            Grid.Column="2" 
                            Focusable="false"
                            IsChecked="{Binding Path=IsDropDownOpen, Mode=TwoWay, RelativeSource={RelativeSource TemplatedParent}}"
                            ClickMode="Press"
                            Background="Transparent"
                            BorderBrush="Transparent">
                            <ToggleButton.Template>
                                <ControlTemplate TargetType="ToggleButton">
                                    <Border Name="Border" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}">
                                        <Grid>
                                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                                            <Path x:Name="Arrow" Data="M 0 0 L 4 4 L 8 0 Z" Fill="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Right" Margin="5" VerticalAlignment="Center"/>
                                        </Grid>
                                    </Border>
                                </ControlTemplate>
                            </ToggleButton.Template>
                        </ToggleButton>
                        <ContentPresenter
                            Name="ContentSite"
                            IsHitTestVisible="False"
                            Content="{TemplateBinding SelectionBoxItem}"
                            ContentTemplate="{TemplateBinding SelectionBoxItemTemplate}"
                            ContentTemplateSelector="{TemplateBinding ItemTemplateSelector}"
                            Margin="3,3,23,3"
                            VerticalAlignment="Center"
                            HorizontalAlignment="Left"/>
                        <TextBox 
                            x:Name="PART_EditableTextBox"
                            Style="{x:Null}" 
                            HorizontalAlignment="Left" 
                            VerticalAlignment="Center"
                            Margin="3,3,23,3"
                            Focusable="True"
                            Background="Transparent"
                            Visibility="Hidden"
                            IsReadOnly="{TemplateBinding IsReadOnly}"/>
                        <Popup 
                            Name="Popup"
                            Placement="Bottom"
                            IsOpen="{TemplateBinding IsDropDownOpen}"
                            AllowsTransparency="True" 
                            Focusable="False"
                            PopupAnimation="Slide">
                            <Grid 
                                Name="DropDown"
                                SnapsToDevicePixels="True"
                                MinWidth="{TemplateBinding ActualWidth}"
                                MaxHeight="{TemplateBinding MaxDropDownHeight}">
                                <Border 
                                    x:Name="DropDownBorder"
                                    Background="{DynamicResource SecondaryPrimaryBackgroundColor}" 
                                    BorderBrush="Gray" 
                                    BorderThickness="1"/>
                                <ScrollViewer Margin="4,6,4,6" SnapsToDevicePixels="True">
                                    <StackPanel IsItemsHost="True" KeyboardNavigation.DirectionalNavigation="Contained"/>
                                </ScrollViewer>
                            </Grid>
                        </Popup>
                    </Grid>
                    <ControlTemplate.Triggers>
                        <Trigger Property="HasItems" Value="false">
                            <Setter TargetName="DropDownBorder" Property="MinHeight" Value="95"/>
                        </Trigger>
                        <Trigger Property="IsEnabled" Value="false">
                            <Setter Property="Foreground" Value="Gray"/>
                        </Trigger>
                        <Trigger Property="IsGrouping" Value="true">
                            <Setter Property="ScrollViewer.CanContentScroll" Value="false"/>
                        </Trigger>
                    </ControlTemplate.Triggers>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
<!--End ComboBox Style-->

<!--ToggleSwitchStyle Style-->
    <Style x:Key="ToggleSwitchStyle" TargetType="CheckBox">
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
<!-- by {emadadel} -->
<ResourceDictionary x:Key="Dark">
<SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#2b2d31"/>
<SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#3c3f40"/>
<SolidColorBrush x:Key="PrimaryButtonForeground" Color="#098fd4" />
<SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
<SolidColorBrush x:Key="TextColorPrimary" Color="WhiteSmoke" />
<SolidColorBrush x:Key="TextColorSecondaryColor" Color="White"/>
<SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#bbbbbb"/>
<SolidColorBrush x:Key="BorderBrush" Color="#2b2d31" />
<SolidColorBrush x:Key="ButtonBorderColor" Color="#1DB954"/>
<SolidColorBrush x:Key="Label" Color="#3f3f3f"/>
<SolidColorBrush x:Key="HighlightColor" Color="CornflowerBlue"/>
<SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
<SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#c9c9c7"/>
<SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#c9c9c7"/>
<Color x:Key="ListViewCardLeftColor">#3c3f44</Color> 
<SolidColorBrush x:Key="itemColor1" Color="#3c3f40"/>
<SolidColorBrush x:Key="itemColor2" Color="#3c3f45"/>
<SolidColorBrush x:Key="logo" Color="CornflowerBlue"/>
<ImageBrush x:Key="BackgroundImage" ImageSource="{x:Null}" Stretch="UniformToFill"/>
<x:String x:Key="SubText">Install Tweaks Tool</x:String>
</ResourceDictionary>
<!--{Dark}-->
<!-- {Dark Knight} -->
<!-- by {Emad Adel} -->
<ResourceDictionary x:Key="DarkKnight">
<SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#081015"/>
<SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#17181D"/>
<SolidColorBrush x:Key="PrimaryButtonForeground" Color="#004D69" />
<SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
<SolidColorBrush x:Key="TextColorPrimary" Color="WhiteSmoke" />
<SolidColorBrush x:Key="TextColorSecondaryColor" Color="White"/>
<SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#bbbbbb"/>
<SolidColorBrush x:Key="BorderBrush" Color="#2b2d31" />
<SolidColorBrush x:Key="ButtonBorderColor" Color="#1DB954"/>
<SolidColorBrush x:Key="Label" Color="#3f3f3f"/>
<SolidColorBrush x:Key="HighlightColor" Color="CornflowerBlue"/>
<SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
<SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#c9c9c7"/>
<SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#c9c9c7"/>
<SolidColorBrush x:Key="itemColor1" Color="#17183D"/>
<SolidColorBrush x:Key="itemColor2" Color="#17182D"/>
<SolidColorBrush x:Key="logo" Color="CornflowerBlue"/>
<ImageBrush x:Key="BackgroundImage" ImageSource="https://images.hdqwalls.com/wallpapers/the-batman-fan-made-4k-xx.jpg" Stretch="UniformToFill"/>
<x:String x:Key="SubText">I am not a hero</x:String>
</ResourceDictionary>
<!-- Name {Dark Knight} -->
<!-- {Light} -->
<!-- by {emadadel} -->
<ResourceDictionary x:Key="Light">
 <SolidColorBrush x:Key="PrimaryBackgroundColor" Color="White"/>
 <SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="WhiteSmoke"/>
 <SolidColorBrush x:Key="PrimaryButtonForeground" Color="#1976d2" />
 <SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
 <SolidColorBrush x:Key="TextColorPrimary" Color="Black" />
 <SolidColorBrush x:Key="TextColorSecondaryColor" Color="Black"/>
 <SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#4B5361"/>
 <SolidColorBrush x:Key="BorderBrush" Color="#FFB3B3B3"/>
 <SolidColorBrush x:Key="ButtonBorderColor" Color="#525FE1"/>
 <SolidColorBrush x:Key="Label" Color="LightBlue"/>
 <SolidColorBrush x:Key="HighlightColor" Color="#098fd4"/>
 <SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
 <SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
 <SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
 <SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="black"/>
 <SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="black"/>
<SolidColorBrush x:Key="itemColor1" Color="#fff1f1f1"/>
<SolidColorBrush x:Key="itemColor2" Color="#fff1f9f9"/>
 <SolidColorBrush x:Key="logo" Color="black"/>
 <ImageBrush x:Key="BackgroundImage" ImageSource="{x:Null}" Stretch="UniformToFill"/>
 <x:String x:Key="SubText">Install Tweaks Tool</x:String>
</ResourceDictionary>
<!-- {Light} -->
<!-- {Palestine} -->
<!-- by {emadadel} -->
<ResourceDictionary x:Key="Palestine">
<SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#FF1F1F1F"/>
<SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#2C211A"/>
<SolidColorBrush x:Key="PrimaryButtonForeground" Color="#FFB80000" />
<SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
<SolidColorBrush x:Key="TextColorPrimary" Color="WhiteSmoke" />
<SolidColorBrush x:Key="TextColorSecondaryColor" Color="White"/>
<SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#bbbbbb"/>
<SolidColorBrush x:Key="BorderBrush" Color="#2b2d31" />
<SolidColorBrush x:Key="ButtonBorderColor" Color="#1DB954"/>
<SolidColorBrush x:Key="Label" Color="#3f3f3f"/>
<SolidColorBrush x:Key="HighlightColor" Color="#FFD10D0D"/>
<SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
<SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#c9c9c7"/>
<SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#c9c9c7"/>
<SolidColorBrush x:Key="itemColor1" Color="#2C211A"/>
<SolidColorBrush x:Key="itemColor2" Color="#2C212D"/>
<SolidColorBrush x:Key="logo" Color="red"/>
<ImageBrush x:Key="BackgroundImage" ImageSource="https://w.wallhaven.cc/full/we/wallhaven-wegrj6.jpg" Stretch="UniformToFill"/>
<x:String x:Key="SubText">#StandWithPalestine</x:String>
</ResourceDictionary>
<!-- Name {Palestine} -->

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
                 <!--Menu-->
    <Menu Grid.Row="0" Grid.Column="0" Background="Transparent" BorderBrush="Transparent" HorizontalAlignment="Left" BorderThickness="0">
        <MenuItem Background="Transparent" BorderBrush="Transparent" BorderThickness="0"  IsEnabled="False" ToolTip="Emad Adel">
            <MenuItem.Icon>
                <Border Background="Transparent" CornerRadius="10" Height="89" Width="89">
                    <StackPanel Orientation="Vertical">
                        <TextBlock Text="itt" VerticalAlignment="Center"  TextAlignment="Center" HorizontalAlignment="Center" Style="{DynamicResource logoText}"/>
                        <TextBlock Text="{DynamicResource SubText}" FontFamily="Arial" TextAlignment="Center" HorizontalAlignment="Center" VerticalAlignment="Center" FontWeight="Normal" FontSize="9" Style="{DynamicResource logoText}" />
                    </StackPanel>
                </Border>
            </MenuItem.Icon>
        </MenuItem>

        <MenuItem VerticalAlignment="Center" HorizontalAlignment="Left" BorderBrush="Transparent">
            <MenuItem.Header>
                <Binding Path="Management" TargetNullValue="Management"/>
            </MenuItem.Header>
            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>

            <MenuItem Name="sysinfo">
                <MenuItem.Header>
                    <Binding Path="System_Info" TargetNullValue="System Info" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
            
            <MenuItem Name="poweroption">
                <MenuItem.Header>
                    <Binding Path="Power_Options" TargetNullValue="Power Options" />
                </MenuItem.Header>
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
            

            <MenuItem Name="services">
                <MenuItem.Header>
                    <Binding Path="Services" TargetNullValue="Services" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="network">
                <MenuItem.Header>
                    <Binding Path="Networks" TargetNullValue="Networks" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="appsfeatures">
                <MenuItem.Header>
                    <Binding Path="Apps_features" TargetNullValue="Programs and Features" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="taskmgr">
                <MenuItem.Header>
                    <Binding Path="Task_Manager" TargetNullValue="Task Manager" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            

            <MenuItem Name="diskmgmt">
                <MenuItem.Header>
                    <Binding Path="Disk_Managment" TargetNullValue="Disk Management" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
            <MenuItem Name="msconfig">
                <MenuItem.Header>
                    <Binding Path="Msconfig" TargetNullValue="System Configuration" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="ev">
                <MenuItem.Header>
                    <Binding Path="Environment_Variables" TargetNullValue="Environment Variables" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text="&#xE81E;"/>
                </MenuItem.Icon>
            </MenuItem>

            <MenuItem Name="spp">
                <MenuItem.Header>
                    <Binding Path="System_Protection" TargetNullValue="System Protection" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>

        </MenuItem>

        <MenuItem VerticalAlignment="Center" HorizontalAlignment="Left" BorderBrush="Transparent">
            <MenuItem.Header>
                <Binding Path="Preferences" TargetNullValue="Preferences"/>
            </MenuItem.Header>
            <MenuItem.Icon>
                 <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>

            <MenuItem Name="restorepoint" InputGestureText="Shift+Q">
                <MenuItem.Header>
                    <Binding Path="Create_restore_point" TargetNullValue="Restore Point" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
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

            <MenuItem Name="save" InputGestureText="Shift+S" ToolTip="Save selected apps">
                <MenuItem.Header>
                    <Binding Path="Save" TargetNullValue="Save" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            

            <MenuItem Name="load" InputGestureText="Shift+D" ToolTip="Restore selected apps">
                <MenuItem.Header>
                    <Binding Path="Restore" TargetNullValue="Restore" />
                </MenuItem.Header>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
            <MenuItem Header="{Binding Theme}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>
                <MenuItem Name="systheme">
                    <MenuItem.Header>
                        <Binding Path="Use_system_setting" TargetNullValue="System Setting" />
                    </MenuItem.Header>
                </MenuItem>
                <MenuItem Name="Dark" Header="Dark"/>
<MenuItem Name="DarkKnight" Header="Dark Knight"/>
<MenuItem Name="Light" Header="Light"/>
<MenuItem Name="Palestine" Header="Palestine"/>
            </MenuItem>
            

            <!-- Music section -->
            <MenuItem Header="{Binding Music}">
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                </MenuItem.Icon>

                <MenuItem Name="moff">
                    <MenuItem.Header>
                        <Binding Path="off" TargetNullValue="Off" />
                    </MenuItem.Header>
                    <MenuItem.InputGestureText>
                        Shift+N
                    </MenuItem.InputGestureText>
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>
                </MenuItem>
                

                <MenuItem Name="mon">
                    <MenuItem.Header>
                        <Binding Path="on" TargetNullValue="On" />
                    </MenuItem.Header>
                    <MenuItem.InputGestureText>
                        Shift+F
                    </MenuItem.InputGestureText>
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>
                </MenuItem>
                
            </MenuItem>
            <!-- Music section -->


            <MenuItem Header="{Binding Language}">
                    <MenuItem.Icon>
                        <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
                    </MenuItem.Icon>

                    <MenuItem Name="systemlang">
                        <MenuItem.Header>
                            <Binding Path="Use_system_setting" TargetNullValue="System Language" />
                        </MenuItem.Header>
                    </MenuItem>
                    <MenuItem Name="ar" Header="عربي"/>
<MenuItem Name="de" Header="Deutsch"/>
<MenuItem Name="en" Header="English"/>
<MenuItem Name="es" Header="Español"/>
<MenuItem Name="fr" Header="Français"/>
<MenuItem Name="ga" Header="Gaeilge"/>
<MenuItem Name="hi" Header="अंग्रेज़ी"/>
<MenuItem Name="it" Header="Italiano"/>
<MenuItem Name="ko" Header="한국어"/>
<MenuItem Name="ru" Header="Русский"/>
<MenuItem Name="tr" Header="Türkçe"/>
<MenuItem Name="zh" Header="中文"/>
            </MenuItem>

            <MenuItem Name="ittshortcut">
                <MenuItem.Header>
                    <Binding Path="Create_desktop_shortcut" TargetNullValue="Create Shortcut" />
                </MenuItem.Header>
                <MenuItem.InputGestureText>
                    Shift+I
                </MenuItem.InputGestureText>
                <MenuItem.Icon>
                    <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
                </MenuItem.Icon>
            </MenuItem>
            
        </MenuItem>

        <MenuItem VerticalAlignment="Center" HorizontalAlignment="Center" BorderBrush="Transparent">

            <MenuItem.Header>
                <Binding Path="Third_party" TargetNullValue="Third Party"/>
            </MenuItem.Header>
            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>

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

            <MenuItem Header="{Binding Browsers_extensions}">

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

            <MenuItem Name="fmhy" ToolTip="The largest collection of free stuff on the internet!" Header="fmhy">
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

        <MenuItem Name="dev" VerticalAlignment="Center" HorizontalAlignment="Center" BorderBrush="Transparent">
            <MenuItem.Header>
                <Binding Path="About" TargetNullValue="About"/>
            </MenuItem.Header>
            <MenuItem.Icon>
                <TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
            </MenuItem.Icon>
        </MenuItem>

    </Menu>
<!--End Menu-->
            <Grid Grid.Column="1" HorizontalAlignment="Right" Margin="0,0,20,0">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="Auto"/>
                    <ColumnDefinition Width="Auto"/>
            </Grid.ColumnDefinitions>
                <!--Search -->
<Grid HorizontalAlignment="Left" Grid.Column="1" VerticalAlignment="Center">
    <TextBox Padding="8"
        Width="120"
        VerticalAlignment="Center"
        HorizontalAlignment="Left"
        Style="{StaticResource SearchBox}"
        Name="searchInput" />
    <Grid Name="search_placeholder">
        <TextBlock 
                Name="SearchIcon"
                Text="" 
                FontSize="15" 
                Foreground="Gray" 
                VerticalAlignment="Center" 
                FontFamily="Segoe MDL2 Assets"
                HorizontalAlignment="Left" 
                IsHitTestVisible="False"
                Margin="10,0,0,0" />
        <TextBlock 
                Text="Ctrl+F" 
                Foreground="Gray" 
                VerticalAlignment="Center" 
                HorizontalAlignment="Left" 
                IsHitTestVisible="False"
                Margin="30,0,0,0" />
    </Grid>
</Grid>
<!--End Search-->

            </Grid>
        </Grid>
    <!--Header Section-->
        <!--TabControl-->
    <TabControl Name="taps" TabStripPlacement="Left" Grid.Row="1" BorderBrush="{x:Null}" Foreground="{x:Null}" Background="{x:Null}">
            <TabItem Name="apps" Header="📦" ToolTip="{Binding apps, TargetNullValue=Apps}" FontSize="18" BorderBrush="{x:Null}" >
                <TreeView Name="appslist" BorderBrush="{x:Null}" Background="{x:Null}" Margin="10">
                    <TreeViewItem Header="Communication" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Telegram Desktop"   Margin="0 10 0 2" Tag="telegram | Telegram.TelegramDesktop | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Signal"   Margin="0 10 0 2" Tag="signal | OpenWhisperSystems.Signal | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Meta Messenger"   Margin="0 10 0 2" Tag="messenger | 9WZDNCRF0083 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Zoom"   Margin="0 10 0 2" Tag="zoom | Zoom.ZoomRooms | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Teams"   Margin="0 10 0 2" Tag="microsoft-teams.install | Microsoft.Teams | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Discord"   Margin="0 10 0 2" Tag="discord | Discord.Discord | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Skype"   Margin="0 10 0 2" Tag="skype | Microsoft.Skype | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Teams Classic Desktop"   Margin="0 10 0 2" Tag="microsoft-teams.install | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Viber"   Margin="0 10 0 2" Tag="viber | XPFM5P5KDWF0JP | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="WhatsApp"   Margin="0 10 0 2" Tag="na | 9NKSQGP7F2NH | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Chatterino"   Margin="0 10 0 2" Tag="chatterino | ChatterinoTeam.Chatterino | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Hexchat"   Margin="0 10 0 2" Tag="hexchat | HexChat.HexChat | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="AyuGramDesktop"   Margin="0 10 0 2" Tag="na | na | ayugramdesktop" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Slack"   Margin="0 10 0 2" Tag="slack | SlackTechnologies.Slack | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Rocket Chat"   Margin="0 10 0 2" Tag="rocketchat | RocketChat.RocketChat | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="TeamSpeak"   Margin="0 10 0 2" Tag="teamspeak | TeamSpeakSystems.TeamSpeakClient | na" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Compression" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="WinRAR"   Margin="0 10 0 2" Tag="winrar | RARLab.WinRAR | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="7Zip"   Margin="0 10 0 2" Tag="7zip | 7zip.7zip | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="PeaZip"   Margin="0 10 0 2" Tag="peazip | Giorgiotani.Peazip | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="PowerISO"   Margin="0 10 0 2" Tag="poweriso | PowerSoftware.PowerISO | na" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Development" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="ImgBurn"   Margin="0 10 0 2" Tag="imgburn | LIGHTNINGUK.ImgBurn | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="XAMPP"   Margin="0 10 0 2" Tag="xampp-81 | ApacheFriends.Xampp.8.2 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Visual Studio Professional 2022"   Margin="0 10 0 2" Tag="visualstudio2022professional | Microsoft.VisualStudio.2022.Professional | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Visual Studio Community 2022"   Margin="0 10 0 2" Tag="visualstudio2022community | Microsoft.VisualStudio.2022.Community | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Unity Hub"   Margin="0 10 0 2" Tag="unity-hub | Unity.UnityHub | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Godot Engine"   Margin="0 10 0 2" Tag="godot | GodotEngine.GodotEngine | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Unity3D Engine"   Margin="0 10 0 2" Tag="unity | Unity.Unity.2020 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Blender"   Margin="0 10 0 2" Tag="blender | BlenderFoundation.Blender | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="VSCode"   Margin="0 10 0 2" Tag="vscode | Microsoft.VisualStudioCode | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Vim"   Margin="0 10 0 2" Tag="vim | vim.vim | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Sublime Text 4"   Margin="0 10 0 2" Tag="sublimetext4 | SublimeHQ.SublimeText.4 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Atom"   Margin="0 10 0 2" Tag="atom | GitHub.Atom | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="InnoSetup"   Margin="0 10 0 2" Tag="innosetup | JRSoftware.InnoSetup | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="PyCharm Community Edition"   Margin="0 10 0 2" Tag="pycharm-community | JetBrains.PyCharm.Community | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="PyCharm Professional Edition"   Margin="0 10 0 2" Tag="pycharm | JetBrains.PyCharm.Professional | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Jetbrains Rider"   Margin="0 10 0 2" Tag="jetbrains-rider | JetBrains.Rider | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NodeJs LTS"   Margin="0 10 0 2" Tag="nodejs-lts | OpenJS.NodeJS.LTS | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Electron"   Margin="0 10 0 2" Tag="electron | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Electrum LTS"   Margin="0 10 0 2" Tag="electronim | Electrum.Electrum | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Hugo"   Margin="0 10 0 2" Tag="hugo | Hugo.Hugo | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Hugo Extended"   Margin="0 10 0 2" Tag="hugo-extended | Hugo.Hugo.Extended | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Notepad++"   Margin="0 10 0 2" Tag="notepadplusplus | Notepad++.Notepad++ | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Windows Terminal"   Margin="0 10 0 2" Tag="microsoft-windows-terminal | Microsoft.WindowsTerminal | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Powershell 7"   Margin="0 10 0 2" Tag="powershell-core | Microsoft.PowerShell | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="dnSpy"   Margin="0 10 0 2" Tag="dnspy | dnSpyEx.dnSpy | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Cheat Engine"   Margin="0 10 0 2" Tag="cheatengine | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Python 3.12.6"   Margin="0 10 0 2" Tag="python | Python.Python.3.9 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Git"   Margin="0 10 0 2" Tag="git | Git.Git | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="GitHub Desktop"   Margin="0 10 0 2" Tag="github-desktop | GitHub.GitHubDesktop | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Docker Desktop"   Margin="0 10 0 2" Tag="docker-desktop | Docker.DockerDesktop | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Docker Compose"   Margin="0 10 0 2" Tag="docker-compose | Docker.DockerCompose | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="PowerToys"   Margin="0 10 0 2" Tag="powertoys | Microsoft.PowerToys | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Notion"   Margin="0 10 0 2" Tag="notion | Notion.Notion | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Android Debug Bridge"   Margin="0 10 0 2" Tag="adb | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Universal ADB Drivers"   Margin="0 10 0 2" Tag="universal-adb-drivers | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Scrcpy"   Margin="0 10 0 2" Tag="scrcpy | Genymobile.scrcpy | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="VirtualBox"   Margin="0 10 0 2" Tag="virtualbox | Oracle.VirtualBox | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Oh My Posh"   Margin="0 10 0 2" Tag="oh-my-posh | JanDeDobbeleer.OhMyPosh | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Nerd Fonts - CascadiaCode"   Margin="0 10 0 2" Tag="nerd-fonts-cascadiacode | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Windows Subsystem for Linux WSL2"   Margin="0 10 0 2" Tag="wsl2 | Microsoft.WSL | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Wamp Server 3.3.5"   Margin="0 10 0 2" Tag="wamp-server | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MongoDB"   Margin="0 10 0 2" Tag="mongodb | MongoDB.Server | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="TablePlus"   Margin="0 10 0 2" Tag="tableplus | TablePlus.TablePlus | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Subtitle Edit"   Margin="0 10 0 2" Tag="subtitleedit | 9NWH51GWJTKN | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="FileZilla"   Margin="0 10 0 2" Tag="filezilla | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Yarn"   Margin="0 10 0 2" Tag="yarn | Yarn.Yarn | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="VMware Workstation Player"   Margin="0 10 0 2" Tag="vmware-workstation-player | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Android Studio"   Margin="0 10 0 2" Tag="androidstudio | Google.AndroidStudio | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Burp Suite Community Edition"   Margin="0 10 0 2" Tag="burp-suite-free-edition | PortSwigger.BurpSuite.Community | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="RepoZ"   Margin="0 10 0 2" Tag="repoz | AndreasWascher.RepoZ | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Go Programming Language"   Margin="0 10 0 2" Tag="golang | Language GoLang.Go | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Rust"   Margin="0 10 0 2" Tag="rust | Rustlang.Rust.GNU | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Postman"   Margin="0 10 0 2" Tag="postman | Postman.Postman | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Azure CLI"   Margin="0 10 0 2" Tag="azure-cli | Microsoft.AzureCLI | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="GameMaker Studio"   Margin="0 10 0 2" Tag="na | YoYoGames.GameMaker.Studio.2 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Charles"   Margin="0 10 0 2" Tag="charles | XK72.Charles | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="espanso"   Margin="0 10 0 2" Tag="espanso | Espanso.Espanso | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Visual Studio 2017 Build "   Margin="0 10 0 2" Tag="visualstudio2017buildtools | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="cURL"   Margin="0 10 0 2" Tag="curl | cURL.cURL | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Git Large File Storage"   Margin="0 10 0 2" Tag="git-lfs | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Clink"   Margin="0 10 0 2" Tag="clink | chrisant996.Clink | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="CMake"   Margin="0 10 0 2" Tag="cmake | Kitware.CMake | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="GitHub CLI"   Margin="0 10 0 2" Tag="gh | GitHub.cli | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Lazygit"   Margin="0 10 0 2" Tag="lazygit | JesseDuffield.lazygit | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Fork"   Margin="0 10 0 2" Tag="git-fork | Fork.Fork | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="PulsarEdit"   Margin="0 10 0 2" Tag="pulsar | Pulsar-Edit.Pulsar | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Python Version Manager"   Margin="0 10 0 2" Tag="pyenv-win | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Pixi"   Margin="0 10 0 2" Tag="pixi | prefix-dev.pixi | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="VSCodium"   Margin="0 10 0 2" Tag="vscodium | VSCodium.VSCodium | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Thonny Python IDE"   Margin="0 10 0 2" Tag="thonny | AivarAnnamaa.Thonny | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Poedit"   Margin="0 10 0 2" Tag="na | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="TypeScript for Visual Studio 2017 and 2019"   Margin="0 10 0 2" Tag="typescript-vs2017-vs2019 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Caret"   Margin="0 10 0 2" Tag="caret | Caret.Caret | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Zulu"   Margin="0 10 0 2" Tag="zulu12 | Azul.Zulu.11.JRE | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="GitHubReleaseNotesv1"   Margin="0 10 0 2" Tag="githubreleasenotes | StefHeyenrath.GitHubReleaseNotes | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Tome"   Margin="0 10 0 2" Tag="tome-editor | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Komodo Edit"   Margin="0 10 0 2" Tag="komodo-edit | ActiveState.KomodoEdit | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="SQLite"   Margin="0 10 0 2" Tag="sqlite | SQLite.SQLite | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MkDocs"   Margin="0 10 0 2" Tag="mkdocs | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MkDocs Material Theme"   Margin="0 10 0 2" Tag="mkdocs-material | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Figma"   Margin="0 10 0 2" Tag="figma | Figma.Figma | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Visual Studio Code Insiders"   Margin="0 10 0 2" Tag="vscode-insiders | Microsoft.VisualStudioCode.Insiders | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="SQLiteStudio"   Margin="0 10 0 2" Tag="sqlitestudio | sqlitestudio.pl.SQLiteStudio | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Octopus Deploy"   Margin="0 10 0 2" Tag="octopusdeploy.tentacle | OctopusDeploy.Tentacle | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="GitKraken"   Margin="0 10 0 2" Tag="gitkraken | Axosoft.GitKraken | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="FFFTP"   Margin="0 10 0 2" Tag="ffftp | Sayuri.FFFTP | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="SmartFTP"   Margin="0 10 0 2" Tag="smartftp | SmartSoft.SmartFTP | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Rclone"   Margin="0 10 0 2" Tag="rclone | Rclone.Rclone | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Cyberduck"   Margin="0 10 0 2" Tag="cyberduck | Iterate.Cyberduck | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Kodu Game Lab"   Margin="0 10 0 2" Tag="na | InfiniteInstant.KoduGameLab | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="GDevelop"   Margin="0 10 0 2" Tag="gdevelop | GDevelop.GDevelop | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MongoDB Tools"   Margin="0 10 0 2" Tag="mongodb-database-tools | MongoDB.DatabaseTools | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="DB Browser for SQLite"   Margin="0 10 0 2" Tag="sqlitebrowser | DBBrowserForSQLite.DBBrowserForSQLite | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MySQL"   Margin="0 10 0 2" Tag="mysql | Oracle.MySQL | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MongoDB Compass"   Margin="0 10 0 2" Tag="mongodb-compass | MongoDB.Compass.Full | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MongoDB Compass readonly"   Margin="0 10 0 2" Tag="mongodb-compass-readonly | MongoDB.Compass.Readonly | na" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Disk Tools" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="AOMEI Partition Assistant Standard"   Margin="0 10 0 2" Tag="partition-assistant-standard | AOMEI.PartitionAssistant | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="AOMEI Backupper Standard"   Margin="0 10 0 2" Tag="backupper-standard | AOMEI.Backupper.Standard | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Recuva recover"   Margin="0 10 0 2" Tag="recuva | Piriform.Recuva | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Hard Disk Sentinel"   Margin="0 10 0 2" Tag="hdsentinel | JanosMathe.HardDiskSentinelPro | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Active@ Partition Recovery"   Margin="0 10 0 2" Tag="na | LSoftTechnologies.ActivePartitionRecovery | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="WinDirStat"   Margin="0 10 0 2" Tag="windirstat | WinDirStat.WinDirStat | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="DiskGenius Free"   Margin="0 10 0 2" Tag="diskgenius | Eassos.DiskGenius | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="UNFORMAT"   Margin="0 10 0 2" Tag="na | LSoftTechnologies.UNFORMAT | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Active@ UNDELETE"   Margin="0 10 0 2" Tag="na | LSoftTechnologies.ActiveUNDELETE | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="HxD Hex Editor"   Margin="0 10 0 2" Tag="hxd | MHNexus.HxD | na" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Documents" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="OpenOffice"   Margin="0 10 0 2" Tag="openoffice | Apache.OpenOffice | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="FoxitReader"   Margin="0 10 0 2" Tag="foxitreader | Foxit.FoxitReader | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="LibreOffice"   Margin="0 10 0 2" Tag="libreoffice-fresh | Foxit.FoxitReader | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="SumatraPDF"   Margin="0 10 0 2" Tag="sumatrapdf.install | SumatraPDF.SumatraPDF | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Office 365 Business"   Margin="0 10 0 2" Tag="office365business | Microsoft.Office | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="ONLY OFFICE"   Margin="0 10 0 2" Tag="onlyoffice | ONLYOFFICE.DesktopEditors | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Ability Office"   Margin="0 10 0 2" Tag="abilityoffice | Ability.AbilityOffice.8.Standard | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="PDF Creator"   Margin="0 10 0 2" Tag="pdfcreator | pdfforge.PDFCreator | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visio Viewer"   Margin="0 10 0 2" Tag="visioviewer | Microsoft.VisioViewer | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Adobe Acrobat Reader"   Margin="0 10 0 2" Tag="adobereader | Adobe.Acrobat.Reader.32-bit | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Flash Player Plugin"   Margin="0 10 0 2" Tag="flashplayerplugin | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Sysinternals"   Margin="0 10 0 2" Tag="sysinternals | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="LibreOffice Still"   Margin="0 10 0 2" Tag="libreoffice-still | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Zettlr"   Margin="0 10 0 2" Tag="zettlr | Zettlr.Zettlr | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Kindle Previewer"   Margin="0 10 0 2" Tag="kindlepreviewer | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="AppGroup"   Margin="0 10 0 2" Tag="na | na | iandiv-appgroup" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Drivers" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="AMD Ryzen Chipset Drivers"   Margin="0 10 0 2" Tag="amd-ryzen-chipset | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NVidia Display Driver"   Margin="0 10 0 2" Tag="nvidia-display-driver | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NVIDIA GeForce Experience"   Margin="0 10 0 2" Tag="geforce-experience | Nvidia.GeForceExperience | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Msi Afterburner"   Margin="0 10 0 2" Tag="msiafterburner | Guru3D.Afterburner | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NVIDIA PhysX"   Margin="0 10 0 2" Tag="physx.legacy | Nvidia.PhysXLegacy | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Driver Easy"   Margin="0 10 0 2" Tag="drivereasyfree | Easeware.DriverEasy | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Intel Graphics Windows DCH"   Margin="0 10 0 2" Tag="intel-graphics-driver | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Intel Driver Support Assistant"   Margin="0 10 0 2" Tag="intel-dsa | Intel.IntelDriverAndSupportAssistant | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Intel Network Adapter"   Margin="0 10 0 2" Tag="intel-network-drivers-win10 | Intel.WiFiDrivers | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Snappy Driver Installer"   Margin="0 10 0 2" Tag="sdio | samlab-ws.SnappyDriverInstaller | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Driver booster"   Margin="0 10 0 2" Tag="driverbooster | IObit.DriverBooster | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Driver Genius"   Margin="0 10 0 2" Tag="drivergenius | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Display Driver Uninstaller"   Margin="0 10 0 2" Tag="ddu | Wagnardsoft.DisplayDriverUninstaller | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Driver Store Explorer"   Margin="0 10 0 2" Tag="rapr | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Intel Wireless Bluetooth for Windows 10 and Windows 11"   Margin="0 10 0 2" Tag="intel-bluetooth-drivers | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Intel Graphics Command Center"   Margin="0 10 0 2" Tag="na | 9PLFNLNT3G5G | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NTLite"   Margin="0 10 0 2" Tag="ntlite-free | Nlitesoft.NTLite | na" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="File Sharing" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="TeamViewer"   Margin="0 10 0 2" Tag="teamviewer | TeamViewer.TeamViewer | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="AnyDesk"   Margin="0 10 0 2" Tag="anydesk | AnyDeskSoftwareGmbH.AnyDesk | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Airdroid"   Margin="0 10 0 2" Tag="airdroid | AirDroid.AirDroid | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="UltraViewer"   Margin="0 10 0 2" Tag="ultraviewer | DucFabulous.UltraViewer | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="qBittorrent"   Margin="0 10 0 2" Tag="qbittorrent | qBittorrent.qBittorrent | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="ShareX"   Margin="0 10 0 2" Tag="sharex | ShareX.ShareX | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Send Anywhere"   Margin="0 10 0 2" Tag="na | Estmob.SendAnywhere | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Google Drive"   Margin="0 10 0 2" Tag="googledrive | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Dropbox"   Margin="0 10 0 2" Tag="dropbox | Dropbox.Dropbox | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft OneDrive"   Margin="0 10 0 2" Tag="onedrive | Microsoft.OneDrive | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="UltraVNC"   Margin="0 10 0 2" Tag="ultravnc | uvncbvba.UltraVnc | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Omnify Hotspot"   Margin="0 10 0 2" Tag="omnifyhotspot | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="HFS HTTP File Server"   Margin="0 10 0 2" Tag="hfs | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="KDE Connect"   Margin="0 10 0 2" Tag="kdeconnect-kde | KDE.KDEConnect | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="pCloud Drive"   Margin="0 10 0 2" Tag="pcloud | pCloudAG.pCloudDrive | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="qBittorrent Enhanced Edition"   Margin="0 10 0 2" Tag="qbittorrent-enhanced | wingetinstallc0re100.qBittorrent-Enhanced-Edition | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Aspia"   Margin="0 10 0 2" Tag="na | na | Aspia" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="SimpleTransfer Desktop"   Margin="0 10 0 2" Tag="simpletransfer | Rambax.SimpleTransfer | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Remote Desktop Manager"   Margin="0 10 0 2" Tag="rdm | Devolutions.RemoteDesktopManager | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="RustDesk"   Margin="0 10 0 2" Tag="rustdesk | RustDesk.RustDesk | na" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Gaming" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Steam"   Margin="0 10 0 2" Tag="steam | Valve.Steam | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Ubisoft Connect"   Margin="0 10 0 2" Tag="ubisoft-connect | Ubisoft.Connect | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Origin"   Margin="0 10 0 2" Tag="origin | ElectronicArts.Origin | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Rockstar Games Launcher"   Margin="0 10 0 2" Tag="rockstar-launcher | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="GameSave Manager"   Margin="0 10 0 2" Tag="gamesavemanager | InsaneMatt.GameSaveManager | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="StreamlabsOBS"   Margin="0 10 0 2" Tag="streamlabs-obs | Streamlabs.StreamlabsOBS | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="OBS Studio"   Margin="0 10 0 2" Tag="obs-studio.install | OBSProject.OBSStudio | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Logitech Gaming Software"   Margin="0 10 0 2" Tag="logitechgaming | Logitech.LGS | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Lively Wallpaper"   Margin="0 10 0 2" Tag="lively | rocksdanister.LivelyWallpaper | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Playnite"   Margin="0 10 0 2" Tag="playnite | Playnite.Playnite | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="BlueStacks"   Margin="0 10 0 2" Tag="bluestacks | BlueStack.BlueStacks | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Epic Games Launcher"   Margin="0 10 0 2" Tag="epicgameslauncher | EpicGames.EpicGamesLauncher | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Ryujinx"   Margin="0 10 0 2" Tag="ryujinx --params | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="x630ce for all games"   Margin="0 10 0 2" Tag="na | na | x360ce" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Cemu"   Margin="0 10 0 2" Tag="cemu | Cemu.Cemu | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="EA App"   Margin="0 10 0 2" Tag="ea-app | ElectronicArts.EADesktop | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="GOG Galaxy"   Margin="0 10 0 2" Tag="goggalaxy | GOG.Galaxy | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Itch.io"   Margin="0 10 0 2" Tag="itch | ItchIo.Itch | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="JoyToKey"   Margin="0 10 0 2" Tag="joytokey | JTKsoftware.JoyToKey | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="RetroArch"   Margin="0 10 0 2" Tag="retroarch | Libretro.RetroArch | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Twitch Desktop App"   Margin="0 10 0 2" Tag="twitch | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Dolphin"   Margin="0 10 0 2" Tag="dolphin | DolphinEmulator.Dolphin | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="mGBA"   Margin="0 10 0 2" Tag="mgba | JeffreyPfau.mGBA | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="EmulationStation"   Margin="0 10 0 2" Tag="emulationstation | Emulationstation.Emulationstation | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="ScummVM"   Margin="0 10 0 2" Tag="scummvm | ScummVM.ScummVM | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Project64"   Margin="0 10 0 2" Tag="project64 | Project64.Project64 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="DOSBox"   Margin="0 10 0 2" Tag="na | DOSBox.DOSBox | na" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Imaging" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="FastStone Image Viewer"   Margin="0 10 0 2" Tag="fsviewer | FastStone.Viewer | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="GIMP"   Margin="0 10 0 2" Tag="gimp | GIMP.GIMP | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Google Earth Pro"   Margin="0 10 0 2" Tag="googleearthpro | Google.EarthPro | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Bandicam"   Margin="0 10 0 2" Tag="na | BandicamCompany.Bandicam | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Inkscape"   Margin="0 10 0 2" Tag="inkscape | Inkscape.Inkscape | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Paint.NET"   Margin="0 10 0 2" Tag="paint.net | dotPDNLLC.paintdotnet | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="iSpy"   Margin="0 10 0 2" Tag="ispy | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="FreeCAD"   Margin="0 10 0 2" Tag="freecad | FreeCAD.FreeCAD | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Interior Design 3D"   Margin="0 10 0 2" Tag="na | AMSSoftware.InteriorDesign3D-e | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MeshLab"   Margin="0 10 0 2" Tag="meshlab | CNRISTI.MeshLab | na" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Media" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="KLite Mega Codec Full Pack"   Margin="0 10 0 2" Tag="k-litecodecpackfull | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="PotPlayer"   Margin="0 10 0 2" Tag="potplayer | Daum.PotPlayer | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="VLC"   Margin="0 10 0 2" Tag="vlc.install | VideoLAN.VLC | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Kodi"   Margin="0 10 0 2" Tag="kodi | 9NBLGGH4T892 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Jellyfin Server"   Margin="0 10 0 2" Tag="jellyfin | Jellyfin.Server | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Winamp"   Margin="0 10 0 2" Tag="winamp | Winamp.Winamp | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Aimp"   Margin="0 10 0 2" Tag="na | na | aimp" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Spotify"   Margin="0 10 0 2" Tag="spotify | Spotify.Spotify | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MusicBee"   Margin="0 10 0 2" Tag="musicbee | MusicBee.MusicBee | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MPC-BE"   Margin="0 10 0 2" Tag="mpc-be |  MPC-BE.MPC-BE | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="QQPlayer"   Margin="0 10 0 2" Tag="na | Tencent.QQPlayer | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Windows Media Player"   Margin="0 10 0 2" Tag="na | 9WZDNCRFJ3PT | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="iTunes"   Margin="0 10 0 2" Tag="itunes | Apple.iTunes | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Spotube"   Margin="0 10 0 2" Tag="spotube | KRTirtho.Spotube | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Audio Switcher"   Margin="0 10 0 2" Tag="audioswitcher | FortyOneLtd.AudioSwitcher | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Mediamonkey"   Margin="0 10 0 2" Tag="mediamonkey | VentisMedia.MediaMonkey | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Universal Media Server"   Margin="0 10 0 2" Tag="ums | UniversalMediaServer.UniversalMediaServer | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="K-Lite Codec Pack Standard"   Margin="0 10 0 2" Tag="k-litecodecpack-standard | CodecGuide.K-LiteCodecPack.Standard | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MPV"   Margin="0 10 0 2" Tag="mpvio | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Media Tools" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="FL Studio"   Margin="0 10 0 2" Tag="ImageLine.FLStudio | ImageLine.FLStudio | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Audacity"   Margin="0 10 0 2" Tag="audacity | Audacity.Audacity | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Format Factory"   Margin="0 10 0 2" Tag="formatfactory | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Kdenlive"   Margin="0 10 0 2" Tag="kdenlive | KDE.Kdenlive | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Openshot"   Margin="0 10 0 2" Tag="openshot | OpenShot.OpenShot | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="FFmpeg"   Margin="0 10 0 2" Tag="ffmpeg | Gyan.FFmpeg | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Plex"   Margin="0 10 0 2" Tag="plex | Plex.Plex | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Plex Media Server"   Margin="0 10 0 2" Tag="plexmediaserver | Plex.PlexMediaServer | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MKVToolNix"   Margin="0 10 0 2" Tag="mkvtoolnix | MoritzBunkus.MKVToolNix | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Clementine"   Margin="0 10 0 2" Tag="clementine | Clementine.Clementine | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Darktable"   Margin="0 10 0 2" Tag="darktable | darktable.darktable | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Flameshot"   Margin="0 10 0 2" Tag="flameshot | Flameshot.Flameshot | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Lightshot"   Margin="0 10 0 2" Tag="lightshot | Skillbrains.Lightshot | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Greenshot"   Margin="0 10 0 2" Tag="greenshot | Greenshot.Greenshot | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="ImageGlass"   Margin="0 10 0 2" Tag="imageglass | DuongDieuPhap.ImageGlass | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Shotcut"   Margin="0 10 0 2" Tag="Shotcut | Meltytech.Shotcut | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Olive Video Editor"   Margin="0 10 0 2" Tag="olive | OliveTeam.OliveVideoEditor | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="VLC Skins"   Margin="0 10 0 2" Tag="vlc-skins | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NTag"   Margin="0 10 0 2" Tag="ntag | nrittsti.NTag | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Volume2"   Margin="0 10 0 2" Tag="volume2 | irzyxa.Volume2Portable | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MediaInfo"   Margin="0 10 0 2" Tag="mediainfo | MediaArea.MediaInfo.GUI | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Aegisub"   Margin="0 10 0 2" Tag="aegisub | Aegisub.Aegisub | na" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Portable" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Rufus Portable"   Margin="0 10 0 2" Tag="rufus | Rufus.Rufus | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Wireless Network Watcher Portable"   Margin="0 10 0 2" Tag="wnetwatcher.portable | NirSoft.WirelessNetworkWatcher | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="x64dbg Portable"   Margin="0 10 0 2" Tag="x64dbg.portable | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="RunAsDate Portable"   Margin="0 10 0 2" Tag="runasdate | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Mark Text"   Margin="0 10 0 2" Tag="marktext.portable | MarkText.MarkText | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="PCSX2 Emulator"   Margin="0 10 0 2" Tag="pcsx2.portable | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="DuckStation"   Margin="0 10 0 2" Tag="na | na | duckstation" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Resource Hacker"   Margin="0 10 0 2" Tag="na | na | resourcehacker" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Runtimes" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Microsoft Visual C++ Runtime - all versions"   Margin="0 10 0 2" Tag="vcredist-all | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="DirectX"   Margin="0 10 0 2" Tag="directx | Microsoft.DirectX | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visual C++ 2005 (x86) Redistributable"   Margin="0 10 0 2" Tag="vcredist2005 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visual C++ 2005 (x64) Redistributable"   Margin="0 10 0 2" Tag="vcredist2005 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visual C++ 2008 (x86) Redistributable"   Margin="0 10 0 2" Tag="vcredist2008 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visual C++ 2008 (x64) Redistributable"   Margin="0 10 0 2" Tag="vcredist2008 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visual C++ 2010 (x86) Redistributable"   Margin="0 10 0 2" Tag="vcredist2010 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visual C++ 2010 (x64) Redistributable"   Margin="0 10 0 2" Tag="vcredist2010 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visual C++ 2012 (x86) Redistributable"   Margin="0 10 0 2" Tag="vcredist2012 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visual C++ 2012 (x64) Redistributable"   Margin="0 10 0 2" Tag="vcredist2012 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visual C++ 2013 (x86) Redistributable"   Margin="0 10 0 2" Tag="vcredist2013 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visual C++ 2013 (x64) Redistributable"   Margin="0 10 0 2" Tag="vcredist2013 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visual C++ 2015-2022 (x64) Redistributable"   Margin="0 10 0 2" Tag="vcredist2015 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visual C++ 2015-2022  (x86) Redistributable"   Margin="0 10 0 2" Tag="vcredist2015 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NET Framework All Versions"   Margin="0 10 0 2" Tag="dotnet-all | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Java SE Runtime Environment 8.0.411"   Margin="0 10 0 2" Tag="jre8 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Windows SDK"   Margin="0 10 0 2" Tag="windows-sdk-10.1 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NET Desktop Runtime 5"   Margin="0 10 0 2" Tag="dotnet-5.0-desktopruntime | Microsoft.DotNet.HostingBundle.5 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NET Desktop Runtime 3"   Margin="0 10 0 2" Tag="Microsoft.DotNet.HostingBundle.3_1 | dotnetcore-3.0-desktopruntime | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NET Desktop Runtime 6"   Margin="0 10 0 2" Tag="dotnet-6.0-desktopruntime | Microsoft.DotNet.HostingBundle.6 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NET Desktop Runtime 7"   Margin="0 10 0 2" Tag="dotnet-7.0-desktopruntime | Microsoft.DotNet.AspNetCore.7 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NET Desktop Runtime 8"   Margin="0 10 0 2" Tag="dotnet-desktopruntime | Microsoft.DotNet.DesktopRuntime.8 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Silverlight"   Margin="0 10 0 2" Tag="silverlight | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Dot Net 3.5"   Margin="0 10 0 2" Tag="dotnet3.5 | Microsoft.DotNet.DesktopRuntime.3_1 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Flash Player ActiveX"   Margin="0 10 0 2" Tag="flashplayeractivex | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Dot Net 4.5.2"   Margin="0 10 0 2" Tag="dotnet4.5.2 | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft .NET SDK 7"   Margin="0 10 0 2" Tag="dotnet-7.0-sdk | Microsoft.DotNet.SDK.7 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft .NET SDK 8"   Margin="0 10 0 2" Tag="dotnet-sdk | Microsoft.DotNet.SDK.Preview | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft ASP.NET Core Runtime 7.0"   Margin="0 10 0 2" Tag="dotnet-aspnetruntime | Microsoft.DotNet.AspNetCore.7 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Aio Runtimes"   Margin="0 10 0 2" Tag="na | na | aio-runtimes" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Visual-C-Runtimes All in One Oct 2024"   Margin="0 10 0 2" Tag="na | na | vsall" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Visual C++ Redistributable for Visual Studio 2015-2022"   Margin="0 10 0 2" Tag="vcredist140 | Microsoft.VCRedist.2015+.x86 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Security" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Malwarebytes"   Margin="0 10 0 2" Tag="malwarebytes | Malwarebytes.Malwarebytes | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Avast Free Antivirus"   Margin="0 10 0 2" Tag="avastfreeantivirus | XPDNZJFNCR1B07 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="AdGuard Home"   Margin="0 10 0 2" Tag="adguardhome | AdGuard.AdGuardHome | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="ESET Internet Security"   Margin="0 10 0 2" Tag="eset-internet-security | ESET.EndpointSecurity | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Ente Auth"   Margin="0 10 0 2" Tag="ente-auth | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Authme - Simple 2FA"   Margin="0 10 0 2" Tag="authme.portable | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Utilities" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="1Password"   Margin="0 10 0 2" Tag="1password | AgileBits.1Password | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="CCleaner"   Margin="0 10 0 2" Tag="ccleaner | SingularLabs.CCEnhancer | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="BCUninstaller"   Margin="0 10 0 2" Tag="bulk-crap-uninstaller | Klocman.BulkCrapUninstaller | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Easy Context Menu"   Margin="0 10 0 2" Tag="ecm | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="HWiNFO"   Margin="0 10 0 2" Tag="hwinfo.install | REALiX.HWiNFO | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Speccy"   Margin="0 10 0 2" Tag="speccy | Piriform.Speccy | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="FurMark"   Margin="0 10 0 2" Tag="furmark | Geeks3D.FurMark | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="CPU-Z"   Margin="0 10 0 2" Tag="cpu-z | CPUID.CPU-Z | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Mem Reduct"   Margin="0 10 0 2" Tag="memreduct | Henry++.MemReduct | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="HandBrake"   Margin="0 10 0 2" Tag="handbrake.install | HandBrake.HandBrake | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Virtual CloneDrive"   Margin="0 10 0 2" Tag="virtualclonedrive | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Ultra ISO"   Margin="0 10 0 2" Tag="ultraiso | EZBSystems.UltraISO | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Ventoy"   Margin="0 10 0 2" Tag="ventoy | Ventoy.Ventoy | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="iVentoy"   Margin="0 10 0 2" Tag="iventoy | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="AutoHotkey"   Margin="0 10 0 2" Tag="autohotkey | AutoHotkey.AutoHotkey | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Rainmeter"   Margin="0 10 0 2" Tag="rainmeter | Rainmeter.Rainmeter | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="FxSound"   Margin="0 10 0 2" Tag="fxsound | FxSoundLLC.FxSound | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Vysor"   Margin="0 10 0 2" Tag="vysor | Vysor.Vysor | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Unified Remote"   Margin="0 10 0 2" Tag="unifiedremote | UnifiedIntents.UnifiedRemote | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="WifiInfoView"   Margin="0 10 0 2" Tag="wifiinfoview | NirSoft.WifiInfoView | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="WirelessNetView"   Margin="0 10 0 2" Tag="wirelessnetview | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Winaero Tweaker"   Margin="0 10 0 2" Tag="winaero-tweaker | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Hosts File Editor"   Margin="0 10 0 2" Tag="hosts.editor | scottlerch.hosts-file-editor | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Everything"   Margin="0 10 0 2" Tag="everything | voidtools.Everything | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="HDD Low Level Format Tool"   Margin="0 10 0 2" Tag="llftool | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="4K Video Downloader"   Margin="0 10 0 2" Tag="4k-video-downloader | OpenMedia.4KVideoDownloader | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="HiSuite"   Margin="0 10 0 2" Tag="na | Huawei.HiSuite | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Flow Launcher"   Margin="0 10 0 2" Tag="flow-launcher | Flow-Launcher.Flow-Launcher | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="IconsExtract"   Margin="0 10 0 2" Tag="iconsext | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="CoreTemp"   Margin="0 10 0 2" Tag="coretemp | ALCPU.CoreTemp | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Winmerge"   Margin="0 10 0 2" Tag="winmerge | WinMerge.WinMerge | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Wireshark"   Margin="0 10 0 2" Tag="wireshark | WiresharkFoundation.Wireshark | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="TeraCopy"   Margin="0 10 0 2" Tag="teracopy | CodeSector.TeraCopy | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="QuickLook"   Margin="0 10 0 2" Tag="quicklook | QL-Win.QuickLook | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Youtube Dl"   Margin="0 10 0 2" Tag="yt-dlp | youtube-dl.youtube-dl | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Winbox"   Margin="0 10 0 2" Tag="na | Mikrotik.Winbox | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="SearchMyFiles"   Margin="0 10 0 2" Tag="searchmyfiles | NirSoft.SearchMyFiles | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="StartIsBack++"   Margin="0 10 0 2" Tag="startisback | StartIsBack.StartIsBack | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Advanced SystemCare Free"   Margin="0 10 0 2" Tag="afedteated | XPFFGSS4Z9M2TX | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="YUMI Legacy"   Margin="0 10 0 2" Tag="yumi | YumiUsb.Legacy | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="YUMI UEFI"   Margin="0 10 0 2" Tag="yumi-uefi | YumiUsb.UEFI | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="OP Auto Clicker"   Margin="0 10 0 2" Tag="autoclicker | OPAutoClicker.OPAutoClicker | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MSEdgeRedirect"   Margin="0 10 0 2" Tag="msedgeredirect | rcmaehl.MSEdgeRedirect | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="StartAllBack"   Margin="0 10 0 2" Tag="startallback | StartIsBack.StartAllBack | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft PC Manager"   Margin="0 10 0 2" Tag="na | 9PM860492SZD | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Stretchly"   Margin="0 10 0 2" Tag="stretchly | Stretchly.Stretchly | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="TreeSize"   Margin="0 10 0 2" Tag="treesizefree | JAMSoftware.TreeSize.Free | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Autoruns"   Margin="0 10 0 2" Tag="autoruns | Microsoft.Sysinternals.Autoruns | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Process Explorer"   Margin="0 10 0 2" Tag="procexp | Microsoft.Sysinternals.ProcessExplorer | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="OpenVPN Connect"   Margin="0 10 0 2" Tag="openvpn-connect | OpenVPNTechnologies.OpenVPNConnect | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Nmap"   Margin="0 10 0 2" Tag="nmap | Insecure.Nmap | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Keyn Stroke"   Margin="0 10 0 2" Tag="key-n-stroke | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Fing"   Margin="0 10 0 2" Tag="fing | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="CopyQ Clipboard Manager"   Margin="0 10 0 2" Tag="copyq | hluk.CopyQ | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Crystal Disk Info"   Margin="0 10 0 2" Tag="crystaldiskinfo | CrystalDewWorld.CrystalDiskInfo | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Crystal Disk Mark"   Margin="0 10 0 2" Tag="crystaldiskmark | CrystalDewWorld.CrystalDiskMark | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="File Converter"   Margin="0 10 0 2" Tag="file-converter | AdrienAllard.FileConverter | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Files"   Margin="0 10 0 2" Tag="files | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="F.lux"   Margin="0 10 0 2" Tag="flux | flux.flux | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="HWMonitor"   Margin="0 10 0 2" Tag="hwmonitor | CPUID.HWMonitor | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="KeePassXC"   Margin="0 10 0 2" Tag="keepassxc | KeePassXCTeam.KeePassXC | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="LocalSend"   Margin="0 10 0 2" Tag="localsend.install | LocalSend.LocalSend | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Windows Auto Dark Mode"   Margin="0 10 0 2" Tag="auto-dark-mode | Armin2208.WindowsAutoNightMode | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Windows Firewall Control"   Margin="0 10 0 2" Tag="windowsfirewallcontrol | BiniSoft.WindowsFirewallControl | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="TightVNC"   Margin="0 10 0 2" Tag="TightVNC | GlavSoft.TightVNC | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="SelfishNet"   Margin="0 10 0 2" Tag="na | na | selfishnet" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Hurl"   Margin="0 10 0 2" Tag="hurl | Orange-OpenSource.Hurl | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="File Hash Generator"   Margin="0 10 0 2" Tag="file-hash-generator | BinaryMark.FileHashGenerator | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Multimark down"   Margin="0 10 0 2" Tag="multimarkdown | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Free Virtual Keyboard"   Margin="0 10 0 2" Tag="free-virtual-keyboard | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="WavPack"   Margin="0 10 0 2" Tag="wavpack | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="ProcessThreadsView"   Margin="0 10 0 2" Tag="processthreadsview | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Win32 OpenSSH"   Margin="0 10 0 2" Tag="openssh | Microsoft.OpenSSH.Beta | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="PuTTY"   Margin="0 10 0 2" Tag="putty | PuTTY.PuTTY | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="WinSCP"   Margin="0 10 0 2" Tag="winscp | WinSCP.WinSCP | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="GPU-Z"   Margin="0 10 0 2" Tag="gpu-z | TechPowerUp.GPU-Z | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="MemTest86"   Margin="0 10 0 2" Tag="na | na | memtest86" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Memtest86 Plus"   Margin="0 10 0 2" Tag="na | na | memtest86plus" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="GrepWin"   Margin="0 10 0 2" Tag="grepwin | StefansTools.grepWin | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NICE DCV Server"   Margin="0 10 0 2" Tag="nice-dcv-server | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Torrid"   Margin="0 10 0 2" Tag="torrid | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Screen To Gif"   Margin="0 10 0 2" Tag="screentogif.portable | NickeManarin.ScreenToGif | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="EarTrumpet"   Margin="0 10 0 2" Tag="eartrumpet | File-New-Project.EarTrumpet | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="SuperCopier2"   Margin="0 10 0 2" Tag="na | na | supercopier2" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="IDA free"   Margin="0 10 0 2" Tag="ida-free | na | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Binary Ninja"   Margin="0 10 0 2" Tag="na | na | binaryninja" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Web Browsers" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Brave"   Margin="0 10 0 2" Tag="brave | Brave.Brave | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Mozilla Firefox"   Margin="0 10 0 2" Tag="firefox | Mozilla.Firefox | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Thorium AVX"   Margin="0 10 0 2" Tag="thorium --params /AVX | Alex313031.Thorium.AVX2 | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Google Chrome"   Margin="0 10 0 2" Tag="googlechrome | Google.Chrome | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Thorium SSE3"   Margin="0 10 0 2" Tag="thorium --params /SSE3 | Alex313031.Thorium | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Mozilla Firefox ESR"   Margin="0 10 0 2" Tag="firefoxesr | Mozilla.Firefox.ESR | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Microsoft Edge"   Margin="0 10 0 2" Tag="microsoft-edge | Microsoft.Edge | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Chromium"   Margin="0 10 0 2" Tag="chromium | eloston.ungoogled-chromium | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Tor Browser"   Margin="0 10 0 2" Tag="tor-browser | TorProject.TorBrowser | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Opera"   Margin="0 10 0 2" Tag="opera | Opera.Opera | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Internet Download Manager"   Margin="0 10 0 2" Tag="internet-download-manager | Tonec.InternetDownloadManager | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="JDownloader"   Margin="0 10 0 2" Tag="jdownloader | AppWork.JDownloader | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="LibreWolf"   Margin="0 10 0 2" Tag="librewolf | LibreWolf.LibreWolf | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Vivaldi"   Margin="0 10 0 2" Tag="vivaldi | VivaldiTechnologies.Vivaldi | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Neat Download Manager"   Margin="0 10 0 2" Tag="na | na | neat" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Falkon"   Margin="0 10 0 2" Tag="falkon | KDE.Falkon | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="PaleMoon"   Margin="0 10 0 2" Tag="paleMoon | MoonchildProductions.PaleMoon | na" Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="ZenBrowser"   Margin="0 10 0 2" Tag="na | Zen-Team.Zen-Browser | na" Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem>
                </TreeView>
            </TabItem>

            <TabItem x:Name="tweeksTab" Header="🛠" ToolTip="{Binding tweaks, TargetNullValue=Tweaks}"  FontSize="18" BorderBrush="{x:Null}" Background="{x:Null}">
                <TreeView Name="tweakslist" BorderBrush="{x:Null}" Background="{x:Null}" Margin="10">
                    <TreeViewItem Header="BIOS" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Enable F8 boot menu options"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Classic" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Restore Classic Context Menu Windows 11"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Activate Windows Classic Photo Viewer"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Classic Volume Control"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable Toggle Key Sounds"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Enable NET 3.5"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Fixer" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="System File Checker"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Restore All Windows Services to Default"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Reset the TCP/IP Stack"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Fix Arabic encoding"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Restore Default File Type Associations"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Other" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Setup Auto login"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Remove Folder Shortcuts From File Explorer"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Performance" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Clean Taskbar"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Remove Microsoft Apps"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Remove Xbox Apps"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Fix Stutter in games"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable Xbox Services"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Turn off background Apps"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Optimize Windows Services"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable Hibernate"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable OneDrive"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Remove OneDrive"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Remove Microsoft Edge (Not Recommended)"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Delete Thumbnail Cache"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable Windows Transparency"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable scheduled defragmentation task"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Super Performance"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Remove Widgets from Taskbar in Windows 11"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Limit Defender CPU Usage"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Optimizing GPU scheduling"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable Fullscreen Optimizations"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Optimize Network"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Enable system cache"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Optimizing NVIDIA GPU settings"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Enable Faster Shutdown"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Personalization" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Set Wallpaper desktop Quality to 100%"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Power" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Enable the Ultimate Performance Power Plan"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable display and sleep mode timeouts"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Privacy" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Super Privacy Disable all Privacy Settings"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable Start Menu Ads"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable Windows Web Search"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable suggestions on Start Menu"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Remove Copilot in Windows 11"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable Recall Snapshots in Windows 11 24H"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable Homegroup"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Remove Home and Gallery from explorer in Windows 11"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Unknown"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Protection" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Disable Wifi Sense"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable Autoplay and Autorun"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Disable SMB Server"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Set current network profile to public"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Storage" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Disk cleanup"   Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem>
                </TreeView>
            </TabItem>

            <TabItem x:Name="SettingsTab" Header="⚙" ToolTip="{Binding settings, TargetNullValue=Settings}" FontSize="18" BorderBrush="{x:Null}" Background="{x:Null}">
                <TreeView Name="SettingsList" BorderBrush="{x:Null}" Background="{x:Null}" Margin="10">
                    <TreeViewItem Header="Accessibility" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Sticky Keys" Name="StickyKeys" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Mouse Acceleration" Name="MouseAcceleration" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="End Task On Taskbar Windows 11" Name="EndTaskOnTaskbarWindows11" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Launch To This PC" Name="LaunchToThisPC" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Drivers" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Disable Automatic Driver Installation" Name="DisableAutomaticDriverInstallation" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Features" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Windows Sandbox" Name="WindowsSandbox" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Windows Subsystem for Linux" Name="WindowsSubsystemforLinux" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="HyperV Virtualization" Name="HyperVVirtualization" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Performance" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Auto End Tasks" Name="AutoEndTasks" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Performance Options" Name="PerformanceOptions" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Always show icons never Thumbnail" Name="AlwaysshowiconsneverThumbnail" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Personalize" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Dark Mode" Name="DarkMode" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Protection" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Show file extensions" Name="Showfileextensions" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="Show Super Hidden" Name="ShowSuperHidden" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /><CheckBox Content="NumLook" Name="NumLook" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Security" Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Core Isolation Memory Integrity" Name="CoreIsolationMemoryIntegrity" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem><TreeViewItem Header="Storage " Margin="8"  Foreground="{DynamicResource TextColorSecondaryColor}"><CheckBox Content="Clear Page File At Shutdown" Name="ClearPageFileAtShutdown" Style="{StaticResource ToggleSwitchStyle}" Margin="0 10 0 2" Tag=" |  | " Foreground="{DynamicResource TextColorSecondaryColor}" /></TreeViewItem>
                </TreeView>
            </TabItem>
    </TabControl>
<!--End TabControl-->
        <Grid Row="2">
  <Grid.ColumnDefinitions>
    <ColumnDefinition Width="*"/>
    <ColumnDefinition Width="auto"/>
  </Grid.ColumnDefinitions>
  <!-- Buttons -->
     <Grid Column="1" Background="Transparent">
      <!--Install Button-->
        <Button
          Name="installBtn"
          Content="{Binding Install, TargetNullValue=Install}"
          FontSize="18"
          Background="Transparent"
          HorizontalAlignment="Center"
          VerticalAlignment="Center"
          HorizontalContentAlignment="Center"
          VerticalContentAlignment="Center"
          Cursor="Hand"
          Width="140" 
          Height="45" 
          Margin="20">
        </Button>
      <!--End Install Button-->
      <!--Apply Button-->
          <Button
            Name="applyBtn"
            Content="{Binding Apply, TargetNullValue=Apply}"
            FontSize="18" 
            Background="Transparent"
            Visibility="Collapsed"
            HorizontalAlignment="Center"
            VerticalAlignment="Center"
            HorizontalContentAlignment="Center"
            VerticalContentAlignment="Center"
            Cursor="Hand"
            Width="140" 
            Height="45" 
            Margin="20">
          </Button>
      <!--End Apply Button-->
    </Grid>
  <!-- Buttons -->
  <!-- Statusbar -->
    <Grid Column="0">
        <TextBlock Name="statusbar"
          Text="✊ #StandWithPalestine"
          HorizontalAlignment="Left"
          VerticalAlignment="Center" 
          TextWrapping="Wrap"
          Padding="10 0 0 0"
          Width="auto"
        />
    </Grid>
  <!-- Statusbar -->
</Grid>
</Grid>
</Window>
<!--End Main Window-->
'
#===========================================================================
#endregion End WPF Main Window
#===========================================================================
#===========================================================================
#region Begin WPF About Window
#===========================================================================
$AboutWindowXaml = '<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="{Binding About, TargetNullValue=About}"
    WindowStartupLocation="CenterScreen"
    Background="{DynamicResource PrimaryBackgroundColor}"
    WindowStyle="ToolWindow"
    Height="555" Width="455"
    ShowInTaskbar="True"
    MinHeight="555"
    MinWidth="455"
    ResizeMode="NoResize"
    Icon="https://raw.githubusercontent.com/emadadel4/ITT/main/icon.ico">
    <Window.Resources>
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
      <!--End Scrollbar Thumbs-->
      <!--Button Style-->
        <Style TargetType="Button">
          <Setter Property="Background" Value="{DynamicResource PrimaryButtonForeground}"/>
          <Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor2}"/>
          <Setter Property="BorderBrush" Value="Transparent"/>
          <Setter Property="BorderThickness" Value="1"/>
          <Setter Property="Template">
              <Setter.Value>
                  <ControlTemplate TargetType="Button">
                      <Border CornerRadius="20" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}">
                          <ContentPresenter HorizontalAlignment="Center"
                                              VerticalAlignment="Center"/>
                      </Border>
                  </ControlTemplate>
              </Setter.Value>
          </Setter>
          <Style.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                  <Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
                  <Setter Property="Foreground" Value="{DynamicResource PrimaryButtonHighlight}"/>
              </Trigger>
          </Style.Triggers>
        </Style>
      <!--End Button Style-->
    </Window.Resources>
  <Grid Margin="8">
      <!-- Define rows and columns for layout -->
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/> <!-- Logo -->
            <RowDefinition Height="Auto"/> <!-- Contribute Names -->
            <RowDefinition Height="Auto"/> <!-- Icons -->
        </Grid.RowDefinitions>
      <!-- Define rows and columns for layout -->
      <!-- Logo Section -->
        <Grid Grid.Row="0">
            <StackPanel Orientation="Vertical">
                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Images/logo.png" 
                Height="90" Width="Auto" HorizontalAlignment="Center" Margin="0"/>
                <TextBlock  
                    Text="Made with ♥ by Emad Adel"
                    TextWrapping="Wrap" 
                    HorizontalAlignment="Center" 
                    Margin="0,5,0,5" 
                    Width="355" 
                    Padding="8" 
                    Foreground="{DynamicResource TextColorSecondaryColor2}" 
                    FontSize="14" 
                    TextAlignment="Center"
                />
                <TextBlock 
                    Name="ver" 
                    Text="9/1/1998" 
                    FontSize="14" 
                    TextAlignment="Center" 
                    Foreground="{DynamicResource TextColorSecondaryColor2}" 
                />
                <!-- Description Section -->
                <TextBlock  
                    Text="ITT created to simplify software installation and Windows tweaks, making it easier for others to use their computers. It is an open-source project, and you can contribute to make it better by adding your favorite apps and more."
                    TextWrapping="Wrap" 
                    HorizontalAlignment="Center" 
                    Margin="0,2,0,2" 
                    Width="355" Padding="8" 
                    Foreground="{DynamicResource TextColorSecondaryColor2}" 
                    FontSize="14" 
                    TextAlignment="Center"
                />
            </StackPanel>
        </Grid>
      <!-- Logo Section End -->
      <!-- Contribute Names Section -->
        <Grid Grid.Row="1">
          <StackPanel Orientation="Vertical">
              <!-- Contribute Names Section -->
              <TextBlock Text="Contributors"
              TextWrapping="Wrap" HorizontalAlignment="Center" Foreground="{DynamicResource TextColorSecondaryColor2}" Margin="0,5,0,5" FontSize="12" FontStyle="Italic" TextAlignment="Center"/>
              <ScrollViewer Grid.Row="2" VerticalScrollBarVisibility="Auto" Height="103">
                <StackPanel Margin="20,0,0,0">
                    <TextBlock Text="emadadel4" Margin="1" Foreground="{DynamicResource TextColorSecondaryColor2}" />
<TextBlock Text="yousefmhmd" Margin="1" Foreground="{DynamicResource TextColorSecondaryColor2}" />
                </StackPanel>
                </ScrollViewer>
          </StackPanel>
        </Grid>
      <!-- Contribute Names Section End -->
      <!-- Social Media Icons Section -->
        <StackPanel Grid.Row="2" Orientation="Horizontal" VerticalAlignment="Bottom" HorizontalAlignment="Center" Margin="0,20,0,0">
            <Button Width="38" Height="38" Name="github" Cursor="Hand" Margin="5">
                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/github.png"/>
            </Button>
            <Button Width="38" Height="38" Name="telegram" Cursor="Hand" Margin="5">
              <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/telegram.png"/>
          </Button>
            <Button Width="38" Height="38"  Cursor="Hand" Name="yt" Margin="5">
                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/youtube.png"/>
            </Button>
            <Button Width="38" Height="38" Name="blog" Cursor="Hand" Margin="5">
                <Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/blog.png"/>
            </Button>
            <Button Width="38" Height="38" Name="coffee" Cursor="Hand" Margin="5">
              <Image Source="https://cdn.buymeacoffee.com/assets/homepage/meta/apple-icon-120x120.png"/>
          </Button>
        </StackPanel>
      <!-- Social Icons Section End -->
  </Grid>
</Window>

'
#===========================================================================
#endregion End WPF About Window
#===========================================================================
#===========================================================================
#region Begin WPF Event Window
#===========================================================================
function Show-Event {
    
    [xml]$event = $EventWindowXaml
    $itt.event = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $event))
    $itt.event.Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.Theme))

    $itt.event.FindName('closebtn').add_MouseLeftButtonDown({ $itt.event.Close() })
    $itt.event.FindName('DisablePopup').add_MouseLeftButtonDown({ DisablePopup; $itt.event.Close() })

    
        $itt.event.FindName('title').text = 'Changelog'.Trim()
        $itt.event.FindName('date').text = '04/01/2025'.Trim()
        
    
            $itt.event.FindName('ytv').add_MouseLeftButtonDown({
                    Start-Process('https://www.youtube.com/watch?v=QmO82OTsU5c')
                })
            
            
            $itt.event.FindName('preview2').add_MouseLeftButtonDown({
                    Start-Process('https://github.com/emadadel4/itt')
                })
            
            
            $itt.event.FindName('shell').add_MouseLeftButtonDown({
                    Start-Process('https://www.youtube.com/watch?v=nI7rUhWeOrA')
                })
            
            
            $itt.event.FindName('preview').add_MouseLeftButtonDown({
                    Start-Process('https://github.com/emadadel4/itt')
                })
            
            
            $itt.event.FindName('esg').add_MouseLeftButtonDown({
                    Start-Process('https://github.com/emadadel4/itt')
                })
            
            

    # Calculate timestamp
    $storedDate = [datetime]::ParseExact($itt.event.FindName('date').Text, 'MM/dd/yyyy', $null)
    $daysElapsed = (Get-Date) - $storedDate
    if (($daysElapsed.Days -ge 1) -and (($itt.PopupWindow -ne "0") -or $i)) {return}
    $itt.event.Add_PreViewKeyDown({ if ($_.Key -eq "Escape") { $itt.event.Close() } })
    if ($daysElapsed.Days -lt 1){$itt.event.FindName('DisablePopup').Visibility = 'Hidden'}
    $itt.event.ShowDialog() | Out-Null

}

function DisablePopup {
    Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 1 -Force
}
$EventWindowXaml = '<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    x:Name="Window" Title="ITT | Event" 
    WindowStartupLocation = "CenterScreen" 
    Background="Transparent"
    WindowStyle="None"
    AllowsTransparency="True"
    Height="600" Width="486"
    ShowInTaskbar = "False"
    Topmost="True"
    Icon="https://raw.githubusercontent.com/emadadel4/ITT/main/icon.ico">
    <Window.Resources>
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
        <!--End Scrollbar Thumbs-->
    </Window.Resources>
    <Window.Triggers>
        <EventTrigger RoutedEvent="Window.Loaded">
            <BeginStoryboard>
                <Storyboard>
                    <DoubleAnimation Storyboard.TargetProperty="Opacity" From="0" To="1" Duration="0:0:0.5"/>
                </Storyboard>
            </BeginStoryboard>
        </EventTrigger>
    </Window.Triggers>
    <Border Background="{DynamicResource PrimaryBackgroundColor}" BorderBrush="{DynamicResource SecondaryPrimaryBackgroundColor}" BorderThickness="4" CornerRadius="10">
    <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="auto"/>
            </Grid.RowDefinitions>
            <StackPanel x:Name="MainStackPanel" Height="Auto" Background="Transparent" Orientation="Vertical" Margin="20">
                <!-- Title -->
                    <Grid Row="0" Background="Transparent">
                        <TextBlock Text="&#10006;" 
                        Name="closebtn"
                        HorizontalAlignment="Right" 
                        VerticalAlignment="Top"
                        Margin="0"
                        Cursor="Hand"
                        Foreground="red" />
                        <StackPanel Orientation="Vertical" Margin="0">
                            <TextBlock 
                            Name="title"
                            Height="Auto"
                            Width="Auto"
                            FontSize="20"
                            Text="What''s New"
                            Foreground="{DynamicResource TextColorSecondaryColor}"
                            FontWeight="SemiBold"
                            TextWrapping="Wrap"
                            VerticalAlignment="Center"
                            HorizontalAlignment="Left" />
                            <TextBlock
                            Name="date" 
                            Height="Auto"
                            Width="Auto"
                            Margin="5,0,0,0"
                            Text="8/29/2024"
                            Foreground="{DynamicResource TextColorSecondaryColor2}"
                            TextWrapping="Wrap"
                            VerticalAlignment="Center"
                            HorizontalAlignment="Left" />
                        </StackPanel>
                    </Grid>
                <!-- End Title -->
            </StackPanel>
        <Grid Row="1" Background="Transparent" Margin="20">
            <ScrollViewer Name="ScrollViewer" VerticalScrollBarVisibility="Auto" Height="Auto">
                <StackPanel Orientation="Vertical">
                    <TextBlock Text=''🎬 Watch demo'' FontSize=''20'' Margin=''0,18,0,30'' FontWeight=''Bold'' Foreground=''{DynamicResource PrimaryButtonForeground}'' TextWrapping=''Wrap''/>
<Image x:Name=''ytv'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
                    <Image.Source>
                        <BitmapImage UriSource=''https://raw.githubusercontent.com/emadadel4/ITT/refs/heads/main/static/Images/thumbnail.jpg''/>
                    </Image.Source>
                </Image> 
<TextBlock Text='' • Keyboard Shortcuts'' FontSize=''20'' Margin=''0,44,0,30'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+A: Clear category filter.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+F: Enter search mode.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+Q: Switch to Apps.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+W: Switch to Tweaks.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+E: Switch to Settings.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+S: Install selected Apps/Tweaks.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift+S: Save selected.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift+D: Load save file.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift+M: Toggle music.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift+P: Open Choco folder.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift+Q: Restore point.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Shift+I: ITT Shortcut.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                

                <StackPanel Orientation=''Vertical''>
                    <TextBlock Text=''• Ctrl+G: Close application.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
                </StackPanel>
                
<TextBlock Text='' • ⚡ Quick Install Your Saved Apps'' FontSize=''20'' Margin=''0,44,0,30'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>
<Image x:Name=''preview'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
                    <Image.Source>
                        <BitmapImage UriSource=''https://github.com/user-attachments/assets/47a321fb-6a8f-4d29-a9a4-bf69d82763a7''/>
                    </Image.Source>
                </Image> 
<TextBlock Text=''You can install your saved apps at any time using the command (Run as Admin is recommended)'' FontSize=''16'' Margin=''25,25,35,0''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>
<Image x:Name=''preview2'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
                    <Image.Source>
                        <BitmapImage UriSource=''https://github.com/user-attachments/assets/2a4fedc7-1d0e-419d-940c-b784edc7d1d1''/>
                    </Image.Source>
                </Image> 
<TextBlock Text='' • 📥 Download any Youtube video'' FontSize=''20'' Margin=''0,44,0,30'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>
<Image x:Name=''shell'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
                    <Image.Source>
                        <BitmapImage UriSource=''https://raw.githubusercontent.com/emadadel4/ShellTube/main/demo.jpg''/>
                    </Image.Source>
                </Image> 
<TextBlock Text=''Shelltube is simple way to downnload videos and playlist from youtube just Launch it and start download your video you can Launch it from Third-party section.'' FontSize=''16'' Margin=''25,25,35,0''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>
<TextBlock Text='' • 💡 A Secret Feature Awaits – Unlock It'' FontSize=''20'' Margin=''0,44,0,30'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>
<Image x:Name=''esg'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
                    <Image.Source>
                        <BitmapImage UriSource=''https://github.com/user-attachments/assets/edb67270-d9d2-4e94-8873-1c822c3afe2f''/>
                    </Image.Source>
                </Image> 
<TextBlock Text=''Can You Find the Hidden Easter Egg? Open the source code and uncover the secret features waiting for you!'' FontSize=''16'' Margin=''25,25,35,0''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>

                </StackPanel>
            </ScrollViewer>
        </Grid>
        <Grid Row="2" Background="Transparent">
                <TextBlock 
                Name="DisablePopup" 
                Foreground="{DynamicResource TextColorSecondaryColor2}"
                Text="Show on update"
                Background="Transparent"
                TextAlignment="Center"
                Cursor="Hand"
                Padding="15"
                Visibility="Visible"
                HorizontalAlignment="Center"
                VerticalAlignment="Center"
                />
        </Grid>
    </Grid>
    </Border>
</Window>
'
#===========================================================================
#endregion End WPF Event Window
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
    'Install-App', 'Install-Winget', 'InvokeCommand', 'Add-Log',
    'Disable-Service', 'Uninstall-AppxPackage', 'Finish', 'Message',
    'Notify', 'UpdateUI', 'Install-ITTAChoco',
    'ExecuteCommand', 'Set-Registry', 'Set-Taskbar',
    'Refresh-Explorer', 'Remove-ScheduledTasks','CreateRestorePoint'
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
    }
    try {
        # Attempt to get existing registry values
        $itt.Theme = (Get-ItemProperty -Path $itt.registryPath -Name "Theme" -ErrorAction Stop).Theme
        $itt.Locales = (Get-ItemProperty -Path $itt.registryPath -Name "locales" -ErrorAction Stop).locales
        $itt.Music = (Get-ItemProperty -Path $itt.registryPath -Name "Music" -ErrorAction Stop).Music
        $itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -ErrorAction Stop).PopupWindow
        $itt.backup = (Get-ItemProperty -Path $itt.registryPath -Name "backup" -ErrorAction Stop).backup
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
                "ga" {"ga"}        
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
                "ga" {"ga"}        
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
    # Check if Music is set to 100, then reset toggle state to false
    $itt.mediaPlayer.settings.volume = "$($itt.Music)"
    if ($itt.Music -eq 0) {
        $global:toggleState = $false
    }
    else {
        $global:toggleState = $true
    }

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
$itt.CurrentList
$itt.CurrentCategory
$itt.Search_placeholder = $itt["window"].FindName("search_placeholder")
$itt.TabControl = $itt["window"].FindName("taps")
$itt.AppsListView = $itt["window"].FindName("appslist")
$itt.TweaksListView = $itt["window"].FindName("tweakslist")
$itt.SettingsListView = $itt["window"].FindName("SettingsList")

# Buttons and Inputs
$itt.Description = $itt["window"].FindName("description")
$itt.Statusbar = $itt["window"].FindName("statusbar")
$itt.InstallBtn = $itt["window"].FindName("installBtn")
$itt.ApplyBtn = $itt["window"].FindName("applyBtn")
$itt.SearchInput = $itt["window"].FindName("searchInput")
$itt.installText = $itt["window"].FindName("installText")
$itt.installIcon = $itt["window"].FindName("installIcon")
$itt.applyText = $itt["window"].FindName("applyText")
$itt.applyIcon = $itt["window"].FindName("applyIcon")
$itt.QuoteIcon = $itt["window"].FindName("QuoteIcon")


# Cacheing Applications & Tweaks for quick respnse
$tweaksDict = @{}
foreach ($tweak in $itt.database.Tweaks) {
    $tweaksDict[$tweak.Name] = $tweak
}

#===========================================================================
#endregion Initialize WPF Controls
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

Startup *> $null
Show-Event

# Search input events
$itt.SearchInput.Add_GotFocus({
        $itt.Search_placeholder.Visibility = "Hidden"
    })

$itt.SearchInput.Add_LostFocus({
        if ([string]::IsNullOrEmpty($itt.SearchInput.Text)) {
            $itt.Search_placeholder.Visibility = "Visible"
        }
    })

# Quick install
if ($i) {
    Quick-Install -file $i *> $null
}

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
