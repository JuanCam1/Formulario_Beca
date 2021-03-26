function processFiles(files) {
    var file = files[0];
    var reader = new FileReader();
        reader.onload = function (e) {
        
        fileOutput.style.backgroundImage = "url('" + e.target.result + "')";
        };
    reader.readAsDataURL(file);
    }
    
     var dropBox;
    window.onload = function() {
        dropBox = document.getElementById("fileOutput");
        dropBox.ondragenter = ignoreDrag;
        dropBox.ondragover = ignoreDrag;
        dropBox.ondrop = drop;
    }
    
    function ignoreDrag(e) {
        e.stopPropagation();
        e.preventDefault();
    }
    
    function drop(e) {
        e.stopPropagation();
        e.preventDefault();
        var data = e.dataTransfer;
        var files = data.files;
        processFiles(files);
    }
//*************************************************** */

    function processFiles2(files) {
        var file2 = files[0];
        
        var reader2 = new FileReader();
        
        reader2.onload = function (b) {
        // Cuando éste evento se dispara, los datos están ya disponibles.
        // Se trata de copiarlos a una área <div> en la página.
       
        fileOutput2.style.backgroundImage = "url('" + b.target.result + "')";
        };
        reader2.readAsDataURL(file2);
        }
        
        // ---------------------------------------
        var dropBox2;
        
        window.onload = function() {
        dropBox2 = document.getElementById("fileOutput2");
        dropBox2.ondragenter = ignoreDrag2;
        dropBox2.ondragover = ignoreDrag2;
        dropBox2.ondrop = drop2;
        }
        
        function ignoreDrag2(b) {
        b.stopPropagation();
        b.preventDefault();
        }
        
        function drop2(b) {
        b.stopPropagation();
        b.preventDefault();
        
        var data2 = b.dataTransfer;
        var files2 = data2.files;
           
        processFiles2(files2);
        }   