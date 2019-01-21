<html>
    <head>
        <title>Cryptography</title>
        <link rel="stylesheet" href="pvcss.css">
    </head>
    <body>
        <a href="index.html"><h3>Cryptography</h3></a>
        <h2>Vignere Cipher</h2>
        <table id="tb">
            <tr>
            <td>PV</td>
            <%for(int i=65;i<=90;i++){%><td><%=(char)i%></td><%}%>
            </tr>
            <%for(int i=65,k=0;i<=90;i++,k++){%>
                <tr><td><%=(char)i%></td><%
                    for(int j=65;j<=90;j++){%>
                    <td><%= j+k<=90?(char)(j+k):(char)(k+j-26)%></td>
                <%}%></tr>
                <%}%>                                             
        </table>
        <div class= "enc">
        <label>Plain Text</label><input type="text" id="pt"><br>
        <label>Key</label><input type="text" id="k"><br>
        <button onclick=encrypt()>Encrypt</button><br><br>
        <label>Cipher Text</label><input type="text" id="gct"><br>            
        </div>
        <div class="dec">
        <label>Cipher Text</label><input type="text" id="ct"><br>
        <label>Key</label><input type="text" id="k"><br>
        <button onclick="decrypt()">Decrypt</button><br><br>
        <label>Plain Text</label><input type="text" id="gpt"><br>
        </div>
        <script>    
            var s="";
            for(i=1;i<=26;i++){
                s=s.concat(document.getElementById("tb").rows[0].cells[i].innerHTML);
            }
            function encrypt(){
                var i=0;
                var k=document.getElementById("k").value.toUpperCase();
                var p=document.getElementById("pt").value.toUpperCase();
                k=generate(p,k)
                document.getElementById("k").value=k;
                document.getElementById("pt").value=p;
                var l="";
                for(i=0;i<p.length;i++){
                    l=l.concat(document.getElementById("tb").rows[s.indexOf(k[i])+1].cells[s.indexOf(p[i])+1].innerHTML);
                }
                document.getElementById("gct").value=l;
            }
            function decrypt(){
                var i=0,j=0,m=0;
                var k=document.getElementById("k").value.toUpperCase();
                var c=document.getElementById("ct").value.toUpperCase(); 
                k=generate(c,k);
                document.getElementById("k").value=k;
                document.getElementById("ct").value=c;
                var l="";
                for(i=0;i<k.length;i++){
                    l=l.concat(s[Math.abs( s.indexOf(c[i]) - s.indexOf(k[i]) ) % 26]);
                }
                document.getElementById("gpt").value=l;
            }                
            function generate(p,k){
                while(k.length<p.length){
                    k=k.concat(k);
                }
                k=k.slice(0,p.length);
                return k;
            }
        </script>
    </body>
</html>
<!--
                
                for(m=0;m<k.length;m++){
                    l2:
                    for(i=1;i<=26;i++){
                        if(document.getElementById("tb").rows[i].cells[0].innerHTML==k[m]){
                            for(j=1;j<=26;j++){
                                if(document.getElementById("tb").rows[i].cells[j].innerHTML==c[m]){
                                    l=l.concat(document.getElementById("tb").rows[0]).cells[j].innerHTML);
                                    break l2;
                                }
                            }
                        }
                    }
                -->