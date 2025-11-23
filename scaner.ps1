   $site = "https://httpbin.org" #Проверка сайта 
 #Комплексный список поддиректорий  (образовательная версия)
$rooms = @('/admin', '/administrator', '/wp-admin', '/panel',  # Панели администратора
    '/dashboard', '/control', '/manager', '/webadmin',
    '/admincp', '/admin.php', '/admin.aspx', '/admin.jsp',
    
    '/login', '/signin', '/auth', '/authenticate',  # Страницы аутентификации и авторизации
    '/logout', '/signout', '/register', '/signup',
    '/password', '/reset', '/forgot-password',
    
    '/api', '/api/v1', '/graphql', '/rest', '/json',  # API endpoints и веб-сервисы
    '/soap', '/xmlrpc', '/webservice', '/endpoint',
    
    '/backup', '/backups', '/bak', '/old', '/temp',  # Бэкапы и временные файлы
    '/tmp', 
    
    '/config', '/configuration', '/settings', # Конфигурационные файлы и настройки

    '.git', '/svn', '/cvs',    # Системы контроля версий

    
    '/env', '/.env', # Файлы окружения и переменные

     '/uploads', '/files', '/images', '/assets',  # Директории загрузок и медиа
    '/static', '/media', '/download', '/export',
    '/uploads/images', '/uploads/files',

    '/test', '/debug', '/dev', '/development',    # Страницы разработки и отладки
    '/staging', '/server-status', '/phpinfo',

    '/.well-known', '/robots.txt', '/sitemap.xml', # Технические файлы и метаданные

    '/shell', '/cmd', '/exec', '/system', # Потенциально опасные endpoints

    '/phpmyadmin', '/mysql', '/database', # Администрирование баз данных

    '/.bash_history', '/passwd', '/shadow') # Системные файлы (Unix/Linux)

    foreach($room in $rooms) { #Создание цикла для переброса поддиректорий 

        $full = "$site$room"  #Слияние сайт+поддиректория

        Write-Host "Проверка" $full  -ForegroundColor Blue # Провека,для удобства сделал показ целого сайта+поддиректория с синим цветом

        try {$quesion = Invoke-WebRequest -uri $full -TimeoutSec 2  #Обработка ошибок внутри цикла

            Write-Host "Сайт" "$full" "СУЩЕСТВУЕТ!" -ForegroundColor Green  #Если существует 

        }

        catch { #В противном случае

            Write-Host "НЕТ ТАКОГО!" -ForegroundColor Red

        }        

    }
