﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="konvatest2.aspx.cs" Inherits="WebApplication1.konvatest2" %>


<html lang="vi">
<head>
    <meta charset="utf-8" />
    <title>Vẽ Nhà Kho</title>
    <script src="https://unpkg.com/konva@9.3.15/konva.min.js"></script>
    <style>
        body { margin: 0; padding: 0; overflow: hidden; }
        #container { border: 1px solid black; }
        #info { position: absolute; top: 10px; left: 10px; background: white; padding: 10px; }
    </style>
</head>
<body>
    <div id="info">Di chuyển chuột qua các hình để xem thông tin.</div>
    <div id="container"></div>

    <div id="coordinates" style="position: absolute; background: white; padding: 5px; border: 1px solid black; display: none;"></div>

    <script>
        var warehouses = <%= GetWarehouses() %>;
        var khuvuc2 = <%= getkhuvuc2() %>;
        var tieude = <%= Gettitle() %>;
        var imagesData = <%= Getimage() %>;
       <%--  const linesData = <%= GetLinesData() %>;--%>
         

        var stage = new Konva.Stage({
            container: 'container',
            width: window.innerWidth,
            height: window.innerHeight,
        });

        var layer = new Konva.Layer();
        stage.add(layer);

       tieude.forEach(function (title) {
            var simpleText = new Konva.Text({
                x: title.X, // Lấy tọa độ từ cơ sở dữ liệu
                y: title.Y,
                text: title.Name, // Lấy tên từ cơ sở dữ liệu
                fontSize: 30,
                fontFamily: 'Calibri',
                fill: 'green',
                draggable: true, // Đặt draggable thành true
            });

            simpleText.on('dragend', function () {
                var newX = simpleText.x();
                var newY = simpleText.y();

                console.log('Vị trí mới:', newX, newY);

                // Gửi tọa độ mới tới server
                fetch('konvatest2.aspx/UpdateWarehouse', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=utf-8'
                    },
                    body: JSON.stringify({ id: title.ID, x: newX, y: newY }) // Sử dụng ID từ cơ sở dữ liệu
                })
                .then(response => response.json())
                .then(data => {
                    console.log('Cập nhật vị trí text thành công:', data);
                })
                .catch((error) => {
                    console.error('Lỗi:', error);
                });
            });

          layer.add(simpleText); 
        });  

       // Tải nhiều ảnh từ dữ liệu đã lấy từ server
        imagesData.forEach(item => {
            const imageObj = new Image();
            imageObj.src = item.src; // Đường dẫn đến ảnh

            imageObj.onload = function () {
                const image = new Konva.Image({
                    x: item.X, // Tọa độ X từ cơ sở dữ liệu
                    y: item.Y, // Tọa độ Y từ cơ sở dữ liệu
                    image: imageObj,
                    width: 100,
                    height: 100,
                    draggable: true, // Cho phép di chuyển
                });

                // Thêm sự kiện dragmove để hiển thị tọa độ
                image.on('dragmove', function () {
                    const coordinatesDiv = document.getElementById('coordinates');
                    coordinatesDiv.style.display = 'block';
                    coordinatesDiv.innerHTML = `X: ${this.x()}<br>Y: ${this.y()}`;

                    const mousePos = stage.getPointerPosition();
                    coordinatesDiv.style.left = mousePos.x + 10 + 'px';
                    coordinatesDiv.style.top = mousePos.y + 10 + 'px';
                });

                // Ẩn tọa độ khi không kéo
                image.on('dragend', function () {
                    document.getElementById('coordinates').style.display = 'none';

                    // Lưu tọa độ vào cơ sở dữ liệu (hoặc xử lý theo nhu cầu)
                    const currentX = this.x();
                    const currentY = this.y();
                    console.log('Tọa độ sau khi di chuyển:', {
                        id: item.ID, // ID của ảnh
                        x: currentX,
                        y: currentY,
                    });

                    // Gọi hàm lưu tọa độ (thay thế bằng fetch nếu cần thiết)
                     fetch('konvatest2.aspx/UpdateWarehouse', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json; charset=utf-8'
                        },
                        body: JSON.stringify({ id: item.ID, x: currentX, y: currentY })
                        })
                        .then(response => response.json())
                        .then(data => {
                            console.log('Cập nhật thành công:', data);
                        })
                        .catch((error) => {
                            console.error('Lỗi:', error);
                        });
                });

                // Thêm ảnh vào layer và vẽ
                layer.add(image);
                layer.draw(); // Vẽ layer
            };

            // Nếu bạn muốn xử lý lỗi khi không tải được ảnh
            imageObj.onerror = function() {
                console.error('Failed to load image:', item.Src);
            };

        });

        //linesData.forEach(line => {
        //        const lineShape = new Konva.Line({
        //            points: [line.StartX, line.StartY, line.EndX, line.EndY, line.id],
        //            stroke: 'black',
        //            strokeWidth: 2,
        //            draggable: true // Cho phép kéo
        //        });

        //        // Thêm sự kiện dragend để cập nhật tọa độ
        //    lineShape.on('dragmove', function () {
        //        const newPoints = this.points();
        //        const coordinatesDiv = document.getElementById('coordinates');
        //        // Cập nhật tọa độ
        //        const StartX = newPoints[0];
        //        const StartY = newPoints[1];
        //        const EndX = newPoints[2];
        //        const EndY = newPoints[3];
                   
        //            //var StartX = lineShape.x();
        //            //var StartY = lineShape.y();
        //            //var EndX = lineShape.x();
        //            //var EndY = lineShape.y();

        //                // Hiển thị tọa độ
        //        coordinatesDiv.style.display = 'block';
        //        coordinatesDiv.innerHTML = `Start: (${StartX}, ${StartY})<br>End: (${EndX}, ${EndY})`;

        //        // Lấy hình chữ nhật bao quanh dòng kẻ
        //        //const rect = this.getClientRect();
        
        //        // Cập nhật vị trí hiển thị tọa độ
        //        //coordinatesDiv.style.left = rect.x + 10 + 'px';
        //        //coordinatesDiv.style.top = rect.y + 10 + 'px';

                    
        
        //        // Cập nhật vị trí hiển thị tọa độ
        //        const mousePos = stage.getPointerPosition();
        //        coordinatesDiv.style.left = mousePos.x + 10 + 'px';
        //        coordinatesDiv.style.top = mousePos.y + 10 + 'px';
                         
        //     });

        //    lineShape.on('dragend', function () {
        //        document.getElementById('coordinates').style.display = 'none';

        //        fetch('konvatest2.aspx/SaveLine', {
        //            method: 'POST',
        //            headers: {
        //                'Content-Type': 'application/json',
        //            },
        //            //body: JSON.stringify(line)
        //            body: JSON.stringify({ 
        //                StartX: line.StartX, 
        //                StartY: line.StartY, 
        //                EndX: line.EndX, 
        //                EndY: line.EndY, 
        //                id: line.id 
        //                })
        //           //body: JSON.stringify({ StartX: StartX, StartY: StartY, EndX: EndX, EndY: EndY,id: line.id})
        //        })
        //        .then(response => {
        //            if (!response.ok) {
        //                throw new Error('Network response was not ok');
        //            }
        //            return response.json();
        //        })
        //        .then(data => {
        //            console.log('Saved successfully:', data);
        //        })
        //        .catch((error) => {
        //            console.error('Error saving data:', error);
        //        });
        //    });

             

        //        layer.add(lineShape);
        //    });


        warehouses.forEach(function (warehouse) {
            // Kiểm tra điều kiện và thay đổi màu sắc
            var fillColor;
            if (warehouse.StatusCheck === '1') { // Thay 'someCondition' bằng điều kiện của bạn
                fillColor = 'yellow'; // Lot cheking
            }
            else if (warehouse.StatusCheck === '2') { // Thay 'someCondition' bằng điều kiện của bạn
                fillColor = 'Orange'; // Lot cheking 2 -> duoc phep di chuyen
            }
            else if (warehouse.StatusCheck === '3') { // Thay 'someCondition' bằng điều kiện của bạn
                fillColor = 'green'; // Lot OK
            }
            else if (warehouse.StatusCheck === '4') { // Thay 'someCondition' bằng điều kiện của bạn
                fillColor = 'red'; // Lot NG
            }
            else {
                fillColor = warehouse.Color; // Màu mặc định trang chua check
            }

            var rect = new Konva.Rect({
                x: warehouse.X,
                y: warehouse.Y,
                width: warehouse.Width,
                height: warehouse.Height,
                fill: fillColor,  //warehouse.Color,
                stroke: 'black',
                strokeWidth: 2,
                draggable: true,
            });

            // Thêm đối tượng text để hiển thị tên kho
            var text = new Konva.Text({
                x: warehouse.X + 10, // Điều chỉnh vị trí x
                y: warehouse.Y + 10, // Điều chỉnh vị trí y
                text: warehouse.Name,
                fontSize: 16,
                fontFamily: 'Calibri',
                fill: 'black', // Màu chữ
            });


            rect.on('mouseenter', function() {
                document.getElementById('info').innerText = warehouse.Name + ' (ID: ' + warehouse.ID + ')';
                document.body.style.cursor = 'pointer';
            });

            rect.on('mouseleave', function() {
                document.getElementById('info').innerText = 'Di chuyển chuột qua các hình để xem thông tin.';
                document.body.style.cursor = 'default';
            });

            rect.on('dragend', function() {
            // Lấy tọa độ mới
            var newX = rect.x();
            var newY = rect.y();

            // Gửi tọa độ mới tới server
            fetch('konvatest2.aspx/UpdateWarehouse', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=utf-8'
                    },
                    body: JSON.stringify({ id: warehouse.ID, x: newX, y: newY })
                })
                .then(response => response.json())
                .then(data => {
                    console.log('Cập nhật thành công:', data);
                })
                .catch((error) => {
                    console.error('Lỗi:', error);
                });
            });

            layer.add(rect);
            layer.add(text);
        });

         khuvuc2.forEach(function(kv2) {
            var rect2 = new Konva.Rect({
                x: kv2.X,
                y: kv2.Y,
                width: kv2.Width,
                height: kv2.Height,
                fill: kv2.Color,
                stroke: 'black',
                strokeWidth: 2,
                draggable: true,
            });

            // Thêm đối tượng text để hiển thị tên kho
            var text2 = new Konva.Text({
                x: kv2.X + 10, // Điều chỉnh vị trí x
                y: kv2.Y + 10, // Điều chỉnh vị trí y
                text: kv2.Name,
                fontSize: 16,
                fontFamily: 'Calibri',
                fill: 'black', // Màu chữ
            });


            rect2.on('mouseenter', function() {
                document.getElementById('info').innerText = kv2.Name + ' (ID: ' + kv2.ID + ')';
                document.body.style.cursor = 'pointer';
            });

            rect2.on('mouseleave', function() {
                document.getElementById('info').innerText = 'Di chuyển chuột qua các hình để xem thông tin.';
                document.body.style.cursor = 'default';
            });

            rect2.on('dragend', function() {
            // Lấy tọa độ mới
            var newX = rect2.x();
            var newY = rect2.y();

            // Gửi tọa độ mới tới server
            fetch('konvatest2.aspx/UpdateWarehouse', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=utf-8'
                    },
                    body: JSON.stringify({ id: kv2.ID, x: newX, y: newY })
                })
                .then(response => response.json())
                .then(data => {
                    console.log('Cập nhật thành công:', data);
                })
                .catch((error) => {
                    console.error('Lỗi:', error);
                });
            });

            layer.add(rect2);
            layer.add(text2);
         });

        

       
      

        layer.draw();

        

    </script>
</body>
</html>
