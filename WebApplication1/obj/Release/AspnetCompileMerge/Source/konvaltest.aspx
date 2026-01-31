<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="konvaltest.aspx.cs" Inherits="WebApplication1.konvaltest" %>

<html>
<head>
    <script src="https://unpkg.com/konva@9.3.15/konva.min.js"></script>
    <meta charset="utf-8" />
    <title>Konva Drag and Drop Multiple Shapes Demo</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <div id="container"></div>
    <button id="saveBtn">Save Positions</button>
    <script>
        var width = window.innerWidth;
        var height = window.innerHeight;

        var stage = new Konva.Stage({
            container: 'container',
            width: width,
            height: height,
        });

        var layer = new Konva.Layer();

        var colors = ['red', 'orange', 'yellow', 'green', 'blue', 'purple'];
        var boxes = [];


         fetch('konvaltest.aspx/GetShapes')
        .then(response => response.json())
        .then(data => {
            const shapes = data.d;
            shapes.forEach(createRectangle);
            layer.draw(); // Vẽ layer
        })
        .catch(error => console.error('Error fetching shapes:', error));

    //// Thêm layer vào stage
    //stage.add(layer);

    //    for (var i = 0; i < 6; i++) {
    //        var box = new Konva.Rect({
    //            x: i * 30 + 50,
    //            y: i * 18 + 40,
    //            fill: colors[i],
    //            stroke: 'black',
    //            strokeWidth: 4,
    //            draggable: true,
    //            width: 100,
    //            height: 50,
    //        });

    //        box.on('dragstart', function () {
    //            this.moveToTop();
    //        });

    //        box.on('dragmove', function () {
    //            document.body.style.cursor = 'pointer';
    //        });

    //        box.on('dblclick dbltap', function () {
    //            this.destroy();
    //        });

    //        box.on('mouseover', function () {
    //            document.body.style.cursor = 'pointer';
    //        });

    //        box.on('mouseout', function () {
    //            document.body.style.cursor = 'default';
    //        });

    //        boxes.push(box); // Lưu hình vào mảng
    //        layer.add(box);
    //    }

        // Thêm layer vào stage
        stage.add(layer);

        // Hàm lưu tọa độ
        document.getElementById('saveBtn').onclick = function () {
            var positions = boxes.map(function (box) {
                return {
                    x: box.x(),
                    y: box.y(),
                    fill: box.fill(),
                };
            });

            fetch('/konvaltest.aspx', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(positions),
            })
            .then(response => response.json())
            .then(data => {
                console.log(data.message);
            })
            .catch(error => console.error('Error:', error));
        };
    </script>
</body>
</html>
