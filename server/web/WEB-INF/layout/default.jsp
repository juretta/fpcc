<%@ include file="/WEB-INF/layout/header.include.jsp"
%><stripes:layout-definition>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Hudson build: @VERSION@ (@BUILTON@) -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="${pageContext.request.locale}" 
    xml:lang="${pageContext.request.locale}">
<head><!-- stripes version 1.5 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="language"                   content="${pageContext.request.locale}" />
    <meta name="Content-Language"           content="${pageContext.request.locale}" /> 
    <meta name="audience"                   content="all" />     
    <meta name="MSSmartTagsPreventParsing"  content="true" />    
    <meta name="revisit-after"              content="1 day" /> 
    <meta name="author"                     content="Stefan Saasen" />
    <meta name="publisher"                  content="" />
    <meta name="robots"                     content="index,follow" />  
    <meta name="description"                content="" />    
    <meta name="keywords"                   content="" />
    
    <link rel="icon" href="<c:url value="/favicon.ico" />" type="image/x-icon" />
    <link rel="shortcut icon" href="<c:url value="/favicon.ico" />" type="image/x-icon" />
    
    <title>Flash platform code camp - Messaging demo</title>
    
    <link rel="start" href="/" />
    <link href="<c:url value="/css/screen.css" />" rel="stylesheet" type="text/css" media="screen" />

</head>

<body id="start">
    <div id="wrapper">
            <stripes:layout-component name="content" />                
    </div>

</body>
</html>
</stripes:layout-definition>

