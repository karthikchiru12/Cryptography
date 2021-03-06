<html>
    <head>
        <title>Cryptography</title>
        <link rel="stylesheet" href="homecss.css">
        <link rel="stylesheet" href="macss.css">
    </head>
    <body>
        <a href="index.html"><h3>Cryptography</h3></a>
        <h2>Monoalphabetic Cipher</h2>
        <table id="tb">
            <tr>
            <td>Alphabet</td>
            <%for(int i=65;i<=90;i++){%><td><%=(char)i%></td><%}%>
            </tr>
            <tr>
            <td>Value</td>
            <% for(int i=65;i<=90;i++){%><td><%=(char)i%></td><%}%>
            </tr>
        </table>
        <div class="k">
        <label>Key</label><input type="text" id="k"><br>
            <button onclick=generate()>Generate Key</button>
        </div>
        <div class= "enc">
        <label>Plain Text</label><input type="text" id="pt"><br>
        <button onclick=encrypt()>Encrypt</button><br><br>
        <label>Cipher Text</label><input type="text" id="gct"><br>            
        </div>
        <div class="dec">
        <label>Cipher Text</label><input type="text" id="ct"><br>
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
                var p=document.getElementById("pt").value.toUpperCase();
                var x=document.getElementById("tb").rows[1];
                var g="";
                for(i=0;i<p.length;i++){
                    g=g.concat(x.cells[s.indexOf(p[i])+1].innerHTML);                    
                }
                document.getElementById("gct").value=g;
            }
            function decrypt(){
                var c="";
                for(i=1;i<=26;i++){
                    c=c.concat(document.getElementById("tb").rows[1].cells[i].innerHTML);
                }
                var i=0;
                var p=document.getElementById("ct").value.toUpperCase();
                var x=document.getElementById("tb").rows[0];
                var g="";
                for(i=0;i<p.length;i++){
                    g=g.concat(x.cells[c.indexOf(p[i])+1].innerHTML);                    
                }
                document.getElementById("gpt").value=g;
            }
            function generate(){
                var i=0;
                var k=document.getElementById("k").value.toUpperCase();
                var gk="";
                for(i=0;i<k.length;i++){
                    if(gk.includes(k[i])==false){
                        gk=gk.concat(k[i]);
                    }
                }
                for(i=1;i<s.length;i++){
                    if(gk.includes(s[i])==false){
                        gk=gk.concat(s[i]);
                    }
                }
                for(i=1;i<26;i++){
                    document.getElementById("tb").rows[1].cells[i].innerHTML=gk[i-1];
                }
            }
        </script>
    </body>
</html>