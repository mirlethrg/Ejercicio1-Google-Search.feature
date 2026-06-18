# language: es
Requisito: Funcionalidades clave de la barra de búsqueda de Google

  @búsqueda_exitosa
  Escenario: Buscar un término existente y obtener resultados relevantes
    Dado que el usuario está en la página principal de Google Search
    Cuando ingresa "automatización de pruebas QA" en la barra de búsqueda
    Y presiona la tecla Enter
    Entonces el sistema debe redirigir a la página de resultados
    Y el primer resultado debe contener el término "automatización de pruebas QA"

  @autocompletar
  Escenario: Visualizar sugerencias automáticas al escribir un término
    Dado que el usuario está en la página principal de Google Search
    Cuando comienza a escribir "cómo aprender Py" en la barra de búsqueda
    Entonces el sistema debe desplegar una lista de sugerencias automáticas
    Y una de las opciones sugeridas debe ser "cómo aprender python"

  @sin_resultados
  Escenario: Buscar un término sin coincidencias y ver el mensaje de error
    Dado que el usuario está en la página principal de Google Search
    Cuando ingresa una cadena de caracteres aleatorios como "asdfghjklñ12345"
    Y hace clic en el botón "Buscar con Google"
    Entonces el sistema debe mostrar una página que indique que no se encontraron resultados
    Y debe sugerir revisar la ortografía o probar con palabras más generales
