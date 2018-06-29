# xslt-inapachewithjavascript
Ejemplo de XSLT para desplegar en un servidor Apache 9 usando Javascript

INSTALACION
Instala el servidor Apache 9, en este caso he utilizado el 9.0.6.
Copia los tres archivos a la carpeta blablabla\apache-tomcat-9.0.6\webapps\docs\
Modifica el archivo blablabla\apache-tomcat-9.0.6\webapps\ROOT\index.jsp
y añade esta linea debajo de "<h3>Recommended Reading:</h3>":
<h4><a href="${tomcatDocUrl}cargaXSL.html">XSL</a></h4>

EJECUCION
Ejecuta haciendo doble click el archivo blablabla\apache-tomcat-9.0.6\bin\startup.bat
Accede a localhost:8080
Clica en el enlace "XSL"

EXPLICACION
El archivo cargaXSL.html se ejecuta en el servidor apache local para evitar la excepcion de cross site validation del navegador Web.
Nada mas cargarse el cuerpo de cargaXSL.html se ejecutan dos peticiones en serie: student.xml y despues rules.xsl.
La primera peticion se ejecuta con loadXMLDoc("./student.xml",funcion1,true); mientras que la segunda (funcion1) se ejecuta al recibir la respuesta:
xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				xml = xhttp.responseXML;
				funcion1();
			}
		};
La funcion1 es loadXMLDoc("./rules.xsl",procesar,false); asi que a su vez ejecuta la funcion procesar al recibir la respuesta:
xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				xsl = xhttp.responseXML;
				procesar();
			}
		};
Despues en procesar() se utiliza la libreria XSLT del navegador Web para convertir student.xml en una pagina web html utilizando las reglas definidas en rules.xsl
El resultado de la conversion lo carga en <div id="example" />
El codigo XSL utiliza plantillas especificas (apply-templates select=) y genericas (template match="/"), algunas pasando parametros (with-param), un bucle for(for-each), un condicional if(if test=), un condicional de seleccion choose(when test=), y acceso a valores del XML (value-of select) y de parametros (value-of select=$).
