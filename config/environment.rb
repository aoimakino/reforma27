# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
AppR27::Application.initialize!

DateTime.now.yesterday.strftime('%d %B %Y %H:%M:%S')
DateTime.now.yesterday.strftime('%d %b %Y %H:%M:%S')
Date::MONTHNAMES = [nil,'Enero','Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']  
Date::DAYNAMES = ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado']
Date::ABBR_MONTHNAMES = [nil,'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic']  
Date::ABBR_DAYNAMES = ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab']
