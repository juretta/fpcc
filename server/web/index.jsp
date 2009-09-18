<%@ include file="/WEB-INF/layout/header.include.jsp"%>
<stripes:layout-render name="/WEB-INF/layout/default.jsp"
    pageTitle="Start">
    
    <stripes:layout-component name="content">

        <h1>Remoting</h1>
        <ul>
            <li><stripes:link href="/app/RemotingDemo.html">Remoting example</stripes:link></li>
        </ul>
        
    
        <h2>Messaging</h2>
        <ul>
            <li><stripes:link href="/app/Start.html">Example: Consumer</stripes:link></li>
            <li><stripes:link href="/app/PushMessages.html">Example: Producer</stripes:link></li>
        </ul>
        
    </stripes:layout-component>
</stripes:layout-render>
