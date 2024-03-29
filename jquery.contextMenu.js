var dhanghoa = function () {
    return {
        themhanghoa: function () {
            var templates = '<div class="themhanghoa">' +
                '<table>' +
                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Mã hàng: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<input value="" id="mahang" name="mahang" class="form-control input-sm" /></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Tên hàng: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<input value="" id="nameproduct" name="nameproduct" class="form-control input-sm" /></td>' +
                '</td></tr>' +
                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Đơn vị tính: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<input value="" id="dvt" name="dvt" class="form-control input-sm" />' +
                '</td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Giá bán: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<input value="" id="giaban" name="giaban" class="form-control input-sm" />' +
                '</td>' +
                '</tr>' +
                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Giá nhập: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<input value="" id="gianhap" name="gianhap" class="form-control input-sm" />' +
                '</td>' +
                '</tr>' +
                '</table>' +
                '</div>';

            dDialog.openContent(djTemplate.render(templates), 'Thêm mới hàng hóa.', {
                modal: false,
                unloadOnHide: true,
                afterShow: function () {
                }
            }, {
                btnOK: {
                    cls: 'L3',
                    title: 'Cập nhật',
                    command: function () {
                        var tenhang = dj('#nameproduct').val();
                        var mahang = dj('#mahang').val();
                        var data = {
                            'mahang': mahang,
                            'tenhang': tenhang,
                            'dvt': dj('#dvt').val(),
                            'giaban': dj('#giaban').val(),
                            'gianhap': dj('#gianhap').val()
                        };
                        dj.getJSON('/modules/hotel/themhanghoa', data, function (rs) {
                            if (rs.err === 0) {
                                dWin.alert('Bạn thêm mới hàng hóa thành công!');
                                dj('#ajax').val(mahang);
                                //truong hop chon them dich vu khi click chuot phai cung them hang hoa duoc
                                dj('.menu_ajax').val(mahang);
                                // dj.getJSON('/modules/hotel/getdichvu', function (rs1) {
                                //     if (rs1.err === 0) {
                                //         dj('.hanghoa').dCbo(rs1.data);
                                //         //dj('#hanghoa option[value=abc]').attr('selected','selected');
                                //         dj('.hanghoa option:last').attr('selected', 'selected');
                                //     }
                                // })
                            }
                        });
                        return true;
                    }
                },
                btnCancel: {cls: 'L4', title: 'Bỏ qua'}
            })

        }
    }
}();
var dgopban = function () {
    return{
        gopbanphong: function () {
            var templates = '<div style="width: 500px; height: 300px;">' +
                '<div><i>Danh sách phòng/bàn đang hoạt động.</i></div></br>' +
               '<div><b>Danh sách khách hàng đã đặt phòng.</b></div>' +
                '<table class="table table-bordered table-striped" style="margin-bottom:0">' +
                '<tr>' +
                '<td style="width:20px">STT</td>' +
                '<td style="width:70px">Tên Phòng</td>' +
                '<td style="width:15px">Gộp</td>' +
                '</tr>' +

                '</table>' +
                '<div id="addlist" style="width:100%;height:250px;overflow-y:scroll">' +
                '<table id="addroom" class="tblRoom table table-bordered table-striped"></table>' +
                '</div>' +
                '</td>' +
                '</tr>' +

                '</table>' +
                '</div>';
             dDialog.openContent(djTemplate.render(templates), 'Gộp phòng/bàn.', {
                modal: false,
                unloadOnHide: true,
                afterShow: function () {
                    var arr_banphong=[];
                    dj.getJSON('/modules/hotel/getphonghoatdong', function (rs) {
                        if (rs.err === 0) {
                            var trs = [];
                            var items = rs.data;
                            // console.log(rs.data);
                            for (var i in items) {
                                var item = items[i];
                                item['i'] = parseInt(i) + 1;
                                var tenphong = items[i]['tenphong'];
                                trs.push(djTemplate.render('<tr>' +
                                    '<td style="width:20px">{i}</td>' +
                                    '<td style="width:70px"><label name="inp{id}">{tenphong}</label></td>' +
                                    '<td style="width: 15px;"><input type="checkbox" id="inp{id}" class="del" value="{id}"/></td></tr>', item));
                            }
                            dj("#addroom").html(trs.join(''));
                             dj('.del').each(function () {
                                var id = dj(this).val();

                                 dj("#inp" + id).click(function () {
                                    var tenphong = dj(this).parent().parent().find('td').eq(1).text();
                                    // alert(tenphong);
                                     arr_banphong.push(tenphong);
                                 })

                             });
                        }
                    });
                    window.arr_banphong = arr_banphong;
                }
            }, {
                btnOK: {
                    cls: 'L3',
                    title: 'Cập nhật',
                    command: function () {
                                var tenbanphong = {};
                                for (var i in arr_banphong){
                                    tenbanphong[arr_banphong[i]] = parseInt(i);
                                    // djLog(tenbanphong);  //{Bàn 2: 0, Bàn 1: 1}
                                }
                                var data ={
                                    'phongbangop': djson.encode(tenbanphong)   //{"Bàn 2":0,"Bàn 1":1}
                                };
                                dj.postJSON('/modules/hotel/xulygopban', data, function (rs) {
                                    if (rs.err === 0) {
                                        var tongtien = rs.tongtienhang;
                                        //dWin.alert('Gộp phòng thành công !');
                                        alert('Tong tien dich vu ban phai thanh toan la :'+tongtien);
                                        // tam thoi dua gia tong tien can thanh toan neu gop phong.
                                        // neu xu ly day can doi trang thai va cap nhat vao co so du lieu
                                    }
                                    else {
                                        dDialog.alertError('Có lỗi, không thể cập nhật.');
                                    }
                                });



                        
                        return true;
                    }
                },
                btnCancel: {cls: 'L4', title: 'Bỏ qua'}
            })
        }
    }
}();
var dhinhthucnghi = function () {
    return {
        // doi hinh thuc nghi neu thoi gian nghi vuot quy dinh
        hinhthucnghi: function () {
            var templates = '<div style="width: 300px; height: 150px;">' +
                '<div><i>Bạn chọn phòng cần chuyển hình thức nghỉ.</i></div></br>' +
                '<table>' +
                '<tr><td><i>Phòng : </i></td>' +
                '<td>' +
                '<select name="phongid" id = "phongid" class="form-control input-sm" rel=""></select></br>' +
                '</td></tr>' +
                '<tr><td><i>Hình thức nghỉ : </i></td>' +
                '<td>' +
                '<select name="dhinhthucnghi" id = "dhinhthucnghi" class="form-control input-sm" rel="">' +
                '<option value="0">Chọn hình thức nghỉ</option>' +
                '<option value="1">Nghỉ theo giờ</option>' +
                '<option value="2">Nghỉ đêm</option>' +
                '<option value="3">Nghỉ ngày</option>' +
                '<option value="4">Nghỉ tuần</option>' +
                '<option value="5">Nghỉ tháng</option>' +
                '</select>' +
                '</td></tr>' +
                '</table>' +
                '</div>';
            dDialog.openContent(djTemplate.render(templates), 'Chuyển hình thức nghỉ.', {
                modal: false,
                unloadOnHide: true,
                afterShow: function () {
                    dj.getJSON('/modules/hotel/getphong', function (rs) {
                        if (rs.err === 0) {
                            dj('#phongid').dCbo(rs.data);
                        }
                    });
                }
            }, {
                btnOK: {
                    cls: 'L3',
                    title: 'Cập nhật',
                    command: function () {
                        var hinhthucnghi = dj('#dhinhthucnghi').val();
                        var tenphong = dj('#phongid').val();
                        dj.getJSON('/modules/hotel/chuyenhinhthucnghi', {
                            'tenphong': tenphong,
                            'hinhthucthue': hinhthucnghi
                        }, function (rs) {
                            if (rs.err === 0) {
                                dWin.alert('Bạn chuyen hinh thuc nghi thanh cong!');
                                // doi hinh thuc nghi o day
                                // var kieunghi = "";
                                // if (hinhthucnghi == 1) {
                                //     kieunghi = "Nghi theo gio";
                                // } else if (hinhthucnghi == 2) {
                                //     kieunghi = "Nghi dem";
                                // } else if (hinhthucnghi == 3) {
                                //     kieunghi = "Nghi ngay";
                                // } else if (hinhthucnghi == 4) {
                                //     kieunghi = "Nghi tuan";
                                // } else {
                                //     kieunghi = "Nghi thang";
                                // }
                                // $("#myList UL LI").each(function () {
                                //     var nameroom = dj(this).find('#tenphong').text();
                                //     if (nameroom == tenphong) {
                                //         dj(this).find("label[name='kieunghi']").text(kieunghi);
                                //     }
                                // })

                            }
                        });
                        return true;
                    }
                },
                btnCancel: {cls: 'L4', title: 'Bỏ qua'}
            })
        }
    }
}();
var dhotel = function () {
    return {
        inhoadon: function (tenkh, mahd, thoigiankhachra, tienphong, thoigianvao, tenphong, tongthoigianthue,
                            giaphongid, mahang, soluong, dongia, tt, tongtien, tongtienhang, tiencoc, mauin) {
            var params = tenkh + '&mahd=' + mahd + '&thoigiankhachra=' + thoigiankhachra + '&tienphong=' + tienphong
                + '&thoigianvao=' + thoigianvao + '&tenphong=' + tenphong + '&tongthoigianthue=' + tongthoigianthue
                + '&giaphongid=' + giaphongid + '&mahang=' + mahang + '&soluong=' + soluong + '&dongia=' + dongia
                + '&tt=' + tt + '&tongtien=' + tongtien + '&tongtienhang=' + tongtienhang + '&tiencoc=' + tiencoc + '&mauin=' + mauin;

            var dialog = '<iframe id="print-iframe" frameborder="0" ' +
                'src="/modules/hotel/inhoadon?tenkh=' + params + '" style="width:700px;height:550px;" ' +
                'class="dialogIframe" allowtransparency="allowtransparency" scrolling="auto">' +
                '</iframe>';
            dDialog.openContent(djTemplate.render(dialog), 'In hóa đơn bán hàng.', {
                    modal: false,
                    unloadOnHide: true,
                    afterShow: function () {
                    }
                }
                , {
                    btnOk: {
                        cls: "L3", title: "In thông tin", command: function () {
                            dj("#print-iframe").get(0).contentWindow.print();
                        }
                    },
                    btnCancel: {
                        cls: "L4", title: "Đóng"
                    }
                });
        },
        huyphong: function () {
            var templates = '<div style="width: 300px; height: 150px;">' +
                '<div><i>Bạn chọn phòng cần hủy.</i></div></br>' +
                '<table>' +
                '<tr><td><i>Phòng : </i></td>' +
                '<td>' +
                '<select name="phongid" id = "phongid" class="form-control input-sm" rel=""></select></br>' +
                '</td></tr>' +
                '</table>' +
                '</div>';
            dDialog.openContent(djTemplate.render(templates), 'Hủy phòng', {
                modal: false,
                unloadOnHide: true,
                afterShow: function () {
                    dj.getJSON('/modules/hotel/gethuyphong', function (rs) {
                        if (rs.err === 0) {
                            dj('#phongid').dCbo(rs.data);
                        }
                    });
                }
            }, {
                btnOK: {
                    cls: 'L3',
                    title: 'Cập nhật',
                    command: function () {
                        var tenphong = dj('#phongid').val();
                        dj.getJSON('/modules/hotel/xulyhuyphong', {
                            'tenphong': tenphong
                        }, function (rs) {
                            if (rs.err === 0) {
                                dWin.alert('Bạn hủy phòng thành công!');
                                $("#myList UL LI").each(function () {
                                    var nameroom = dj(this).find('#tenphong').text();
                                    if (nameroom == tenphong) {
                                        $(this).find("img").attr('src','/static/images/phongtrong.jpg');
                                    }
                                })
                            }
                        });
                        return true;
                    }
                },
                btnCancel: {cls: 'L4', title: 'Bỏ qua'}
            })
        },
        datphong: function () {
            var templates = '<div class="ddatphong">' +
                '<table>' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Phòng đặt: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><select name="phongdat" id = "phongdat" class="form-control input-sm" rel=""></select></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Đặt cọc: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input value="" id="dtiencoc" name="dtiencoc" class="form-control input-sm" /></td>' +
                '</td></tr>' +
                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Ngày vào: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +

                '<input disabled="disabled" type="text" id="ngayvao" name="ngayvao"' +
                'style="width:200px;float:left" class="form-control input-sm"' +
                'placeholder="Ngày đặt phòng" maxlength="16" value=""/>' +
                '<a style="float:right;font-size:130%"' +
                'onclick="dDialog.calendar({txtid:\'ngayvao\',showDate:true,clearBox:false})">' +
                '<i class="fa fa-calendar"/>&nbsp;</a>' +

                '</td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Ngày ra: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +

                '<input disabled="disabled" type="text" id="ngayra" name="ngayra"' +
                'style="width:200px;float:left" class="form-control input-sm"' +
                'placeholder="Ngày ra" maxlength="16" value=""/>' +
                '<a style="float:right;font-size:130%"' +
                'onclick="dDialog.calendar({txtid:\'ngayra\',showDate:true,clearBox:false})">' +
                '<i class="fa fa-calendar"/>&nbsp;</a>' +

                '</td>' +
                '</td></tr>' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Tên khách hàng : <span style="color:red">(!)</span></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="tenkh" name="tenkh" class="form-control input-sm" /></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Địa chỉ: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="diachi" name="diachi" class="form-control input-sm" /></td>' +
                '</td></tr>' +
                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>CMT: <span style="color:red">(!)</span></b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="cmt" name="cmt" class="form-control input-sm" /></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Ghi chú: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="ghichu" name="ghichu" class="form-control input-sm" /></td>' +
                '</td></tr>' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Hình thức thuê: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<select name="hinhthucthue" id = "hinhthucthue" class="form-control input-sm" rel="">' +
                '<option value="0">Chọn hình thức nghỉ</option>' +
                '<option value="1">Nghỉ theo giờ</option>' +
                '<option value="2">Nghỉ đêm</option>' +
                '<option value="3">Nghỉ ngày</option>' +
                '<option value="4">Nghỉ tuần</option>' +
                '<option value="5">Nghỉ tháng</option>' +
                '<option value="6">Nghỉ cả ngày</option>' +
                '</select></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Giá phòng: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input value="" id="giaphong" name="giaphong" class="form-control input-sm" /></td>' +
                '</td></tr>' +

                '<tr>' +
                '<td colspan="4">' +
                '<div><b>Danh sách khách hàng đã đặt phòng.</b></div>' +
                '<table class="table table-bordered table-striped" style="margin-bottom:0">' +
                '<tr>' +
                '<td style="width:20px">STT</td>' +
                '<td style="width:70px">Phòng đặt</td>' +
                '<td style="width:98px">Ngày vào</td>' +
                '<td style="width:103px">Ngày ra</td>' +
                '<td style="width:80px">Tiền coc</td>' +
                '<td style="width:75px">Kiểu nghỉ</td>' +
                '<td style="width:90px">Tên khách hàng</td>' +
                '<td style="width:15px">Add</td><td style="width:15px">Del</td>' +

                '</tr>' +

                '</table>' +
                '<div id="addlist" style="width:100%;height:200px;overflow-y:scroll">' +
                '<table id="addroom" class="tblRoom table table-bordered table-striped"></table>' +
                '</div>' +
                '</td>' +
                '</tr>' +

                '</table>' +
                '</div>';
            dDialog.openContent(djTemplate.render(templates), 'Đặt phòng.', {
                modal: false,
                unloadOnHide: true,
                afterShow: function () {
                    dj.getJSON('/modules/hotel/getphong', function (rs) {
                        if (rs.err === 0) {
                            dj('#phongdat').dCbo(rs.data);
                        }
                    });

                    dj('#hinhthucthue').change(function () {
                        var tenphong = dj('#phongdat').val();
                        var hinhthucnghi = dj(this).val();
                        dj.getJSON('/modules/hotel/hinhthucnghi', {
                            'hinhthucnghi': hinhthucnghi,
                            'tenphong': tenphong
                        }, function (rs) {
                            var tienphong = rs.data;
                            dj('#giaphong').val(tienphong);
                        });
                    });

                    dj.getJSON('/modules/hotel/getphongdadat', function (rs) {
                        if (rs.err === 0) {
                            var trs = [];
                            var items = rs.data;
                            //console.log(rs.data);
                            for (var i in items) {
                                var item = items[i];
                                item['i'] = i;
                                trs.push(djTemplate.render('<tr>' +
                                    '<td style="width:41px">{i}</td>' +
                                    '<td style="width:72px"><label name="inp{id}" for="inp{id}">{tenphong}</label></td>' +
                                    '<td style="width:101px">{ngaygiothue}</td>' +
                                    '<td style="width:106px">{ngaygiora}</td>' +
                                    '<td style="width:75px">{tiencoc}</td>' +
                                    '<td style="width:80px" id="hinhthucnghi">{hinhthucnghi}</td>' +
                                    '<td style="width:100px">{tenkhachhang}</td>' +
                                    '<td style="width: 30px;" id="add"><input type="radio" value="{id}" id="radio" name="radio1"></td>' +

                                    '<td style="width: 30px;"><input type="checkbox" class="del" id="inp{id}" value="{id}"/></td></tr>', item));
                            }
                            dj("#addroom").html(trs.join(''));
                            dj('input:radio').change(function () {
                                var tenphongdat = dj(this).parent().parent().find('td').eq(1).text();
                                var idhd = dj("input[type='radio']:checked").val();
                                dDialog.confirm('Bạn có muốn chuyển sang trạng thái thuê phòng không?', function () {
                                    dj.getJSON('/modules/hotel/xacnhandatphong', {'idhd': idhd}, function (rs) {
                                        if (rs.err === 0) {
                                            dWin.alert('Chuyển thành công !');
                                            //var hinhthucnghi = dj('input:radio').parent().parent().find('td').eq(5).text();
                                            //var kieunghi = "";
                                            //if (hinhthucnghi == 1){
                                            //    kieunghi = "Nghi theo gio";
                                            //} else if (hinhthucnghi == 2){
                                            //    kieunghi = "Nghi dem";
                                            //} else if (hinhthucnghi == 3){
                                            //    kieunghi = "Nghi ngay";
                                            //} else if(hinhthucnghi == 4){
                                            //    kieunghi = "Nghi tuan";
                                            //} else {
                                            //    kieunghi = "Nghi thang";
                                            //}
                                            dj('input:radio').parent().parent().remove();
                                            $("#myList UL LI").each(function () {
                                                var nameroom = dj(this).find('#tenphong').text();
                                                if (nameroom == tenphongdat) {
                                                    $(this).find("img").attr('src','/static/images/cokhach.jpg');
                                                    //dj(this).attr('style', 'background-color:pink;');
                                                    //dj(this).find("label[name='kieunghi']").text(kieunghi);
                                                }
                                            })
                                        }
                                        else {
                                            dDialog.alertError('Có lỗi, không thể cập nhật.');
                                        }
                                    });
                                    return true;
                                }, {title: 'Bật chế độ thuê phòng'});
                            });

                            dj('.del').each(function () {
                                var id = dj(this).val();
                                dj("#inp" + id).click(function () {
                                    var tenphongdat = dj(this).parent().parent().find('td').eq(1).text();
                                    dDialog.confirm('Bạn có muốn hủy đặt phòng không?', function () {
                                        dj.getJSON('/modules/hotel/huydatphong', {'idhd': id}, function (rs) {
                                            if (rs.err === 0) {
                                                dWin.alert('Hủy phòng thành công !');
                                                dj('.del').parent().parent().remove();
                                                // doi trang thai
                                                $("#myList UL LI").each(function () {
                                                var nameroom = dj(this).find('#tenphong').text();
                                                if (nameroom == tenphongdat) {
                                                    //dj(this).attr('style', 'background-color:#6cc8ef;');
                                                    $(this).find("img").attr('src','/static/images/phongtrong.jpg');
                                                }
                                            })
                                            }
                                            else {
                                                dDialog.alertError('Có lỗi, không thể cập nhật.');
                                            }
                                        });
                                        return true;
                                    }, {title: 'Hủy đặt phòng'});
                                });
                            });
                        }
                    });



                }
            }, {
                btnOK: {
                    cls: 'L3',
                    title: 'Cập nhật',
                    command: function () {
                        var phongdat = dj('#phongdat').val();
                        var tiencoc = dj('#dtiencoc').val();
                        var ngayvao = dj('#ngayvao').val();
                        var ngayra = dj('#ngayra').val();
                        var tenkh = dj('#tenkh').val();
                        var diachi = dj('#diachi').val();
                        var cmt = dj('#cmt').val();
                        var ghichu = dj('#ghichu').val();
                        var hinhthucthue = dj('#hinhthucthue').val();
                        var giaphong = dj('#giaphong').val();
                        var data = {
                            'phongdat': phongdat,
                            'tiencoc': tiencoc,
                            'ngayvao': ngayvao,
                            'ngayra': ngayra,
                            'tenkh': tenkh,
                            'diachi': diachi,
                            'cmt': cmt,
                            'ghichu': ghichu,
                            'hinhthucthue': hinhthucthue,
                            'giaphong': giaphong
                        };
                        dj.getJSON('/modules/hotel/xulydatphong', data, function (rs) {
                            if (rs.msg === 0) {
                                alert('Bạn chọn lại phòng.');
                            }
                            if (rs.err === 0) {
                                dWin.alert('Bạn đặt phòng thành công!');
                                $("#myList UL LI").each(function () {
                                    var nameroom = dj(this).find('#tenphong').text();
                                    if (nameroom == phongdat) {
                                        //dj(this).attr('style', 'background-color:#449d44;');
                                        $(this).find("img").attr('src','/static/images/phongdattruoc.jpg');
                                    }
                                })
                            }
                        });
                        return true;
                    }
                },
                btnCancel: {cls: 'L4', title: 'Bỏ qua'}
            })
        },
        thuephong: function (action, el, tenphong, items, tienhanghoa) {
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!
            var yyyy = today.getFullYear();
            var hour = today.getHours();
            var minute = today.getMinutes();
            var second = today.getSeconds();
            if (hour.toString().length == 1) {
                var hour = '0' + hour;
            }
            if (minute.toString().length == 1) {
                var minute = '0' + minute;
            }
            if (second.toString().length == 1) {
                var second = '0' + second;
            }
            if (dd < 10) {
                dd = '0' + dd
            }
            if (mm < 10) {
                mm = '0' + mm
            }
            var ngayvao = dd + '/' + mm + '/' + yyyy;
            var giovao = hour + ':' + minute + ':' + second;
            //var ngaygiothue = dd + '/' + mm + '/' + yyyy + ' '+ hour + ':' + minute + ':' + second;
            var ngaygiothue = yyyy + '-' + mm + '-' + dd + ' ' + hour + ':' + minute + ':' + second;
            var templates = '<div class="dthuephong">' +
                '<table>' +
                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Hình thức thuê: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<select name="hinhthucthue" id = "hinhthucthue" class="form-control input-sm" rel="">' +
                '<option value="0">Chọn hình thức nghỉ</option>' +
                '<option value="1">Nghỉ theo giờ</option>' +
                '<option value="2">Nghỉ đêm</option>' +
                '<option value="3">Nghỉ ngày</option>' +
                '<option value="4">Nghỉ tuần</option>' +
                '<option value="5">Nghỉ tháng</option>' +
                '<option value="6">Nghỉ cả ngày</option>' +
                '<option value="7">Dịch vụ KARAOKE</option>' +
                '</select></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Tiền cọc: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="dtiencoc" name="tiencoc" class="form-control input-sm" value="" /></td>' +
                '</td></tr>' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Thuê phòng: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="thuephong" name="thuephong" class="form-control input-sm" value="'+ tenphong +'" /></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Giá phòng: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input value="0" id="giaphong" name="giaphong" class="form-control input-sm" /></td>' +
                '</td></tr>' +
                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Ngày vào: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="ngayvao" name="ngayvao" class="form-control input-sm" value="' + ngayvao + '" /></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Giờ vào: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="giovao" name="giovao" class="form-control input-sm" value="' + giovao + '" /></td>' +
                '</td></tr>' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Tên khách hàng : <span style="color:red">(!)</span></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="tenkh" name="tenkh" class="form-control input-sm" /></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Địa chỉ: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="diachi" name="diachi" class="form-control input-sm" /></td>' +
                '</td></tr>' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>CMT: <span style="color:red">(!)</span></b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="cmt" name="cmt" class="form-control input-sm" /></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Ghi chú: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="ghichu" name="ghichu" class="form-control input-sm" /></td>' +
                '</td></tr>' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>NV phục vụ</b></td>' +
                '<td><select class="tennhanvienms form-control input-sm" name="tennhanvienms" style="float: left"  ></select></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Số người ở:</b></td>'+
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="songuoio" name="songuoio" value="0" class="songuoio form-control input-sm" /></td>' +
                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>NV Giới thiệu</b></td>' +
                '<td><select class="nvgioithieu form-control input-sm" name="nvgioithieu" style="float: left"  ></select></td></tr>'+
                '</tr>' +
                    '<tr><td><input type="hidden" id="ngaygiothue" name="ngaygiothue" value="' + ngaygiothue + '" /></td></tr>'+
                '</table>' +

                '</div>';
            dDialog.openContent(djTemplate.render(templates), 'Khách thuê phòng.', {
                modal: false,
                unloadOnHide: true,
                afterShow: function () {
                    //cb ten nhanvien massage
                    dj.getJSON('/modules/hotel/getnhanvienms', function (rs) {
                        if (rs.err === 0) {
                            dj('.tennhanvienms').dCbo(rs.data);
                        }
                    });
                     //cb nhan vien gioi thieu
                    dj.getJSON('/modules/hotel/getnguoigioithieu', function (rs) {
                        if (rs.err === 0) {
                            dj('.nvgioithieu').dCbo(rs.data);
                        }
                    });
                    dj('#hinhthucthue').change(function () {
                        var hinhthucnghi = dj(this).val();
                        dj.getJSON('/modules/hotel/hinhthucnghi', {
                            'hinhthucnghi': hinhthucnghi,
                            'tenphong': tenphong
                        }, function (rs) {
                            // djLog(rs.data);
                            var tienphong = rs.data;
                            dj('#giaphong').val(tienphong);
                            //console.log(rs.data);
                        });
                    });
                }
            }, {
                btnOK: {
                    cls: 'L3',
                    title: 'Cập nhật',
                    command: function () {
                        // xu ly trang thai
                        var ngaygiothue = dj('#ngaygiothue').val();
                        var tenphong = dj('#thuephong').val();
                        var ngayvao = dj('#ngayvao').val();
                        var giovao = dj('#giovao').val();
                        var giaphong = dj('#giaphong').val();
                        var hinhthucthue = dj('#hinhthucthue').val();
                        var tenkh = dj('#tenkh').val();
                        var cmt = dj('#cmt').val();
                        var diachi = dj('#diachi').val();
                        var ghichu = dj('#ghichu').val();
                        var dtiencoc = dj('#dtiencoc').val();
                        var songuoio = dj('.songuoio').val();
                        var idnv = dj('.tennhanvienms').val();
                        var idnvgt = dj('.nvgioithieu').val();
                        var item = items;
                        var tienhang = tienhanghoa;
                        var trangthai = action;
                        //cap nhat trang thai thue phong  -- phai lay tu co so du lieu ra thi f5 khong bi thay doi trang thai
                        var data = {
                            'ngaygiothue': ngaygiothue,
                            'ngayvao': ngayvao,
                            'giovao': giovao,
                            'tenphong': tenphong,
                            'giaphong': giaphong,
                            'hinhthucthue': hinhthucthue,
                            'tenkh': tenkh,
                            'cmt': cmt,
                            'diachi': diachi,
                            'ghichu': ghichu,
                            'trangthai': trangthai,
                            'tiencoc': dtiencoc,
                            'songuoio': songuoio,
                            'idnv': idnv,
                            'idnvgt': idnvgt,
                            'item': djson.encode(item),
                            'tienhang': tienhang
                        };
                        dj.getJSON('/modules/hotel/xulythuephong', data, function (rs1) {
                            if (rs1.err === 0) {
                                //hien thi thong tin thue phong
                                var giovao = rs1.giovao;
                                var kieunghi = rs1.kieunghi;
                                var loaiphong = rs1.loaiphong;
                                var songuoi = rs1.songuoio;
                                var msgkn = "";
                                var msglp = "";
                                if (kieunghi == 1){
                                     msgkn = "Nghỉ theo giờ"
                                } else if(kieunghi == 2){
                                     msgkn = "Nghỉ theo giờ"
                                } else if (kieunghi == 3){
                                    msgkn = "Nghỉ ngày"
                                } else if (kieunghi) {
                                    msgkn = "Nghỉ tuần"
                                } else {
                                    msgkn = "Nghỉ tháng"
                                }
                                if (loaiphong == 1){
                                    msglp = "Phong don"
                                } else if (loaiphong == 2){
                                    msglp = "Phong doi"
                                } else if (loaiphong == 3){
                                    msglp = "P. Vip don"
                                } else if (loaiphong == 4){
                                    msglp = "P. Vip doi"
                                } else if (loaiphong == 5){
                                    msglp = "P. Cao cap"
                                } else {
                                    msglp = "P. Tap the"
                                }

                                dj('#checkinput').val(giovao);
                                dj('#stylerender').val(msgkn);
                                dj('#styleroom').val(msglp);
                                dj('#songuoio').val(songuoi);
                                // doi trang thai thue phong
                                $("#myList UL LI").each(function () {
                                    var nameroom = dj(this).find('#tenphong').text();
                                    if (nameroom == tenphong){
                                        dj(this).find("img").attr('src','/static/images/cokhach.jpg');
                                        // dj(this).find("label[name='songuoi']").text(songuoi);
                                    }
                                })
                            }
                        });
                        return true;
                    }
                },
                btnCancel: {cls: 'L4', title: 'Bỏ qua'}
            })
        },
	traphong: function (action, el, tenphong, sohoadon, ngaygiovao, giaphong, hinhthucnghi, tenkh, tiencoc, hanghoa,tienphutroi) {
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!
            var yyyy = today.getFullYear();
            var hour = today.getHours();
            var minute = today.getMinutes();
            var second = today.getSeconds();
            if (hour.toString().length == 1) {
                var hour = '0' + hour;
            }
            if (minute.toString().length == 1) {
                var minute = '0' + minute;
            }
            if (second.toString().length == 1) {
                var second = '0' + second;
            }
            if (dd < 10) {
                dd = '0' + dd
            }
            if (mm < 10) {
                mm = '0' + mm
            }
            //var ngayra = dd + '/' + mm + '/' + yyyy;
            var giora = hour + ':' + minute + ':' + second;
            // var ngaygiora = dd + '/' + mm + '/' + yyyy + ' ' + hour + ':' + minute + ':' + second;
            var ngaygiora = yyyy + '-' + mm + '-' + dd + ' ' + hour + ':' + minute + ':' + second;
            var ngaygiora2 = mm + '/' + dd + '/' + yyyy + ' ' + hour + ':' + minute + ':' + second;
            var ngaygiora3 = yyyy + '-' + mm + '-' + dd + ' ' + hour + ':' + minute + ':' + second;

            var date1 = new Date(ngaygiovao);
            var date2 = new Date(ngaygiora2);
            var diffMs = (date2 - date1); // milliseconds between now & date1
            var diffHrs = Math.round((diffMs % 86400000) / 3600000); // hours
            var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000); // minutes

            // loi > 30 phut so gio tu dong cong them 1. -> da xu ly
            if (diffMins > 30 && diffMins <60){
                diffHrs = diffHrs -1;
                //alert(diffHrs);
            } else {
                diffHrs = Math.round((diffMs % 86400000) / 3600000)
            }
            var diffDays = Math.round(diffMs / 86400000);

            // loi > 12h van tinh thanh mot ngay -> da xu ly
            // var diffDays = 0;
            // if (diffHrs > 12 && diffHrs < 24) {
            //     diffDays = 0;
            // } else {
            //     diffDays = Math.round(diffMs / 86400000); // days
            // }
            //alert(diffDays);

            //tinh tien phong
            var tienthuephong = 0;
            var tienphaithu = 0;
            var tienmotphut = giaphong/60;

            //nghi theo gio = hinh thuc nghi = 1
            if (parseInt(hinhthucnghi) == 1) {
                tienthuephong = giaphong;
                if (diffDays < 1) {
                    if (diffHrs < 1) {
                        if (diffMins >= 30 && diffMins <= 60) {
                            alert('1');
                            //tienthuephong = giaphong + 20000;
                            tienthuephong = giaphong;
                        } else {
                            alert('2');
                            //tienthuephong = giaphong + 20000;
                            tienthuephong = giaphong;
                            // < 30 phut + 20k
                        }
                    }

                    if (diffHrs >= 1 && diffHrs < 6 ) {
                            //alert('3');
                            //var tiengiosau = (diffHrs - 1) * 20000;
                            //tienthuephong = (giaphong) + tiengiosau;

                            if (diffMins > 15) {
                                if (diffHrs == 1){
                                alert('so 1aaaa');
                                    var tiengiosau = (diffHrs - 1) * tienphutroi + tienphutroi;
                                    tienthuephong = (giaphong) + tiengiosau;
                                } else {
                                    var tiengiosau = (diffHrs - 1) * tienphutroi + tienphutroi;
                                    tienthuephong = (giaphong) + tiengiosau;
                                    alert('nho hon 15 phut' + tienthuephong);
                                }
                            }
                    }
                    if (diffHrs >= 6 && diffHrs < 12) {
                        alert('Truong hop nghi tu 5h den 12h');
                        if((tenphong == "P.301")||(tenphong == "P.401")||(tenphong == "P.402")||(tenphong == "P.501")||(tenphong == "P.502"))
                        {
                            tienthuephong = 250000; //VIP1
                        }else if((tenphong == "P.305")||(tenphong == "P.306")||(tenphong == "P.405")||(tenphong == "P.406")||(tenphong == "P.505"))
                        {
                            tienthuephong = 200000;  //VIP2
                        }else if( (tenphong == 'P.303')||(tenphong == 'P.403')||(tenphong == 'P.503')||(tenphong == 'P.601')||(tenphong == 'P.602')||(tenphong == 'P.605')||(tenphong == 'P.606'))
                        {
                            tienthuephong = 150000; //VIP3
                        }else if( (tenphong == 'P.304')||(tenphong == 'P.404')||(tenphong == 'P.504')||(tenphong == 'P.603')||(tenphong == 'P.701')||(tenphong == 'P.702'))
                        {
                            tienthuephong = 120000; //VIP4
                        }
                    }
                    if (diffHrs >= 12) {
                        alert('Bạn nghỉ > 12h, Bạn co cần đổi hình thức nghỉ khong???');
                        //var tiengiosau = (diffHrs - 1) * 20000;
                        //tienthuephong = (giaphong) + tiengiosau;
                        if (diffMins > 15){
                                var tiengiosau = (diffHrs - 1) * tienphutroi + tienphutroi;
                                tienthuephong = (giaphong) + tiengiosau;
                            } else {
                                var tiengiosau = (diffHrs - 1) * tienphutroi + tienphutroi;
                                tienthuephong = (giaphong) + tiengiosau;
                            }
                    }
                } else if(diffDays >= 1 ) {
                    alert('Bạn nghỉ trên số giờ quy định vượt quá 12h, bạn cần đổi hình thức nghỉ!');
                    if (diffHrs >= 12){
                         diffDays = diffDays -1;   // loi > 12h van tinh thanh mot ngay -> da xu ly o day*****
                        //alert('ngay '+diffDays + 'gio ' +diffHrs);
                        var new_gio = (diffDays * 24) + diffHrs;
                        //alert('so gio moi'+ new_gio)
                        var tiengiosau = (new_gio - 1) * tienphutroi;
                        tienthuephong = (giaphong) + tiengiosau;
                        //alert('tien thue phong'+tienthuephong);
                    }
                    if (diffHrs < 12){
                        //alert('ngay '+diffDays + 'gio ' +diffHrs);
                        var new_gio = (diffDays * 24) + diffHrs;
                        //alert('so gio moi'+ new_gio)
                        var tiengiosau = (new_gio - 1) * tienphutroi;
                        tienthuephong = (giaphong) + tiengiosau;
                        //alert('tien thue phong'+tienthuephong);
                    }
                }
                // nghi theo ngay *** truong hop khach bao nghi so ngay -> chuc nang thao bao ngay nghi gan hets
            } else if (parseInt(hinhthucnghi) == 3) {
                // hinh thuc nghi theo ngay -> chot theo 12h la het ngay.
                if (diffDays < 1) {
                    tienthuephong = giaphong; // bang gia mot ngay
                    /*
                    alert('th1');
                    //truong hop khach vao chua het mot ngay nhung qua 12h van tinh mot ngay
                    if (diffHrs < 8) {
                        //neu nghi ngay khach ra som < 12 tieng // tienthuephong = giaphong*%1ngay
                        tienthuephong = giaphong * (10 / 100)
                    } else {
                        tienthuephong = giaphong; // bang gia mot ngay
                        alert(tienthuephong);
                    }
                    */
                // >= 1 ngay
                } else {
                    //alert('th2');
                    //nghi ngay neu lon hon 6 tieng thi moi tieng sau thu them 20000
                    if (diffHrs >= 6 && diffHrs <= 18) {
                        tienthuephong = (diffDays * giaphong) + (diffHrs - 6) * 20000;
                        //alert(tienthuephong);
                    } else if (diffHrs > 18) {  // truong hop khach ra muon gan mot ngay > 18 tieng thi tinh la mot ngay
                        tienthuephong = (diffDays * giaphong) + giaphong;
                        //alert(tienthuephong);
                    } else { // truong hop khach ra muon < 6 tieng thi thoi khong tinh them
                        tienthuephong = (diffDays * giaphong);
                        //alert(tienthuephong)
                    }
                }
                // truong hop nghi dem
            } else if (parseInt(hinhthucnghi) == 2) {
                // truong hop khach ra muon co the ban them ve nghi them gio. (thuoc nhom nghi them gio)
                if (diffHrs > 12) {
                    alert("Ban nghi dem qua 12h, so gio vuot: "+ (diffHrs-12) +" /h");
                    var tiengiosau = (diffHrs - 12) * tienphutroi;
                    tienthuephong = (giaphong) + tiengiosau;
                }
                else {
                    tienthuephong = giaphong;
                }
                // truong hop nghi tuan
            } else if (parseInt(hinhthucnghi) == 4) {
                tienthuephong = giaphong;
                //alert(tienthuephong);
                // truong hop nghi thang
            } else if (parseInt(hinhthucnghi) == 5) {
                tienthuephong = giaphong;
                //alert(tienthuephong);
            } else if (parseInt(hinhthucnghi) == 6){
                tienthuephong = giaphong;
                // truong hop nghi ca ngay
            } else if (parseInt(hinhthucnghi) == 7){
                var thoigiandung = 0;
                if (diffDays < 1) {
                    if (diffHrs < 1){
                        thoigiandung = diffMins;
                        //alert('1')
                    }else {
                        thoigiandung = (diffHrs * 60) + diffMins;
                        //alert('2')
                    }
                }
                if (diffDays >= 1) {
                    var new_gio = (diffDays * 24) + diffHrs;
                    var new_phut = new_gio * 60;
                    //alert('so phut cua ngay' + new_phut);
                    thoigiandung = diffMins + new_phut;
                }
                //djLog(thoigiandung);
                //djLog(tienmotphut);
                tienthuephong = parseInt(thoigiandung*tienmotphut);
            }

            if (tenkh == null) {
                tenkh = "Khách vẵng lai"
            }
            var tiendatcoc = tiencoc;
            if (tiendatcoc == null) {
                tiendatcoc = 0;
            }
            var tienhang = parseInt(hanghoa['tienhang']);
            // djLog(tiencoc);
            //alert(tienhang); // co ra tien hang

            tienphaithu = tienthuephong + tienhang - tiendatcoc;

            var templates = '<div id="formthanhthoan">' +
                '<table id="dtraphong">' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Khách hàng:</b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><label style="width: 200px;" id="tenkh" name="tenkh">' + tenkh + '</label></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Số HĐ: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><label style="width: 200px;" id="sohd" name="sohd">' + sohoadon + ' </label></td>' +
                '</td></tr>' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Vào lúc:</b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><label style="width: 200px; color: red" id="giovao" name="giovao">' + ngaygiovao + '</label></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Ra lúc: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><label style="width: 200px; color: red" id="giora" name="giora">' + ngaygiora2 + '</label></td>' +
                '</td></tr>' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Tên phòng:</b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><label style="width: 200px;" id="tenphong" name="tenphong" class="hdtenphong">' + tenphong + '</label></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Đơn giá: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<label style="width: 200px;" id="dongia" name="dongia"><b id="giaphongid">' + giaphong + '</b><b>(/ 1h, 1Đ, 1N, 1T)</b></label></td>' +
                '</td></tr>' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Thời gian ở:</b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<label style="width: 200px;" id="thoigianthue" name="thoigianthue" class="thogiano">' + diffDays + ' Ngày <br>' + diffHrs + ' Giờ <br>' + diffMins + ' Phút</label></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Tổng tiền phòng:</b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b id="tienthuephong">' + tienthuephong + '</b> VNĐ</td>' +
                '</td></tr>' +

                '</table>' +

                '<table id="tbnhaphang" class="display table table-bordered dataTable no-footer">' +
                '<tr>' +
                '<td>Tên hàng</td><td>Số lượng</td><td>Đơn giá</td><td>Thành tiền</td><td>Ghi chú</td>' +
                '</tr>{trs}</table>' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Tiền hàng: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<input style="width:80px; padding-left:5px;" id="tienhang2" name="tienhang" disabled="disabled"/></td>' +

                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Tiền cọc: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<label style="width:80px; padding-left:5px;" id="tiencoc" name="tiencoc" class="tiencoc">' + tiendatcoc + '</label></td>' +
                '</tr>' +

                '<tr>' +
                '<td style="padding-bottom:10px; padding-right:10px;"><b>Tổng tiền: </b></td>' +
                '<td style="padding-bottom:10px; padding-left:10px;">' +
                '<label style="width:80px; padding-left:5px;" id="tongtien" name="tongtien">'+ tienphaithu +'</label><b>/VNĐ</b></td><br>' +

                '<td style="padding-bottom:10px; padding-right:10px;"><b>Chiết khấu: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<input style="width:80px; padding-left:5px;" id="chietkhau" name="chietkhau" value="0"/></td>' +

                '<td style="padding-bottom:10px; padding-right:10px;"><b>Thành tiền: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<input style="width:80px; padding-left:5px;" id="tienthanhtoan" name="tienthanhtoan" value="'+ tienphaithu +'" /></td>' +

                '<td style="padding-bottom:10px; padding-right:10px;"><b>Khách thanh toán: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<input style="width:80px; padding-left:5px;" id="khachthanhtoan" name="khachthanhtoan" value="'+ tienphaithu +'" /></td>' +

                '<td style="padding-bottom:10px; padding-right:10px;">' +
                '<b id="lblconlai">Còn lại :</b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<input style="width:80px; padding-left:5px;" id="conlai" name="conlai" value="0" /></td>' +

                '</tr><br>' +

                '<span style="padding-right: 30px;">' +
                '<input name="inkhongcanhoi" class="inkhongcanhoi" type="checkbox" value="" />' +
                '<i class="fa fa-print" style="font-size:25px; padding-left:10px;"></i> <b> Xem in (A4) </b></span><br>' +
                '<input name="inmaunho" class="inmaunho" type="checkbox" value="" />' +
                '<i class="fa fa-print" style="font-size:25px; padding-left:10px;"></i> <b> In mau nho (K80) </b></span>'+

                '</div>';
            // lay thong tin hang hoa neu khach dung
            var item = hanghoa;
            item['items'] = djson.decode(hanghoa['items']);

            // djLog(hanghoa['items']); //{ cafeden=1,  cafenau=1}

            var trs = [];
            for (var i in hanghoa['items']) {
                var soluong = hanghoa['items'][i];
                var mahang = i;
                for (var k in hanghoa['giaban']) {
                    if (mahang == k) {
                        var giaban = hanghoa['giaban'][k];
                        var thanhtien = soluong * giaban;
                    }
                }
                var data = {
                    'mahang': mahang,
                    'soluong': soluong,
                    'giaban': giaban,
                    'thanhtien': thanhtien
                };
                var newrow = djTemplate.render('<tr>' +
                    '<td id="tenhang">{mahang}</td>' +
                    '<td id="soluong">{soluong}</td>' +
                    '<td id="giale" class="giale">{giaban}</td>' +
                    '<td id="thanhtien" class="thanhtien">{thanhtien}</td>' +
                    '<td></td>' +
                    '</tr>', data);
                trs.push(djTemplate.render(newrow));
            }
            item['trs'] = trs.join('');
            // --- end
            dDialog.openContent(djTemplate.render(templates, item), 'Thanh toán tiền phòng ' + tenphong + '', {
                modal: false,
                unloadOnHide: true,
                afterShow: function () {
                    //djLog(item['tienhang']);
                    dj('#tienhang2').val(item['tienhang']);
                    //djLog(item['items']); // Object { cafeden=1,  cafenau=1}
                    var hh = djson.encode(item['items']);
                    //djLog(hh) //{"cafeden":1,"cafenau":1}
                    var mahang = [];
                    var soluong = [];
                    var dongia = [];
                    var tt = [];
                    for (var i in item['items']) {
                        mahang.push(i);
                        soluong.push(item['items'][i]);
                    }
                    dj('.giale').each(function () {
                        var giale = dj(this).text();
                        dongia.push(giale)
                    });
                    dj('.thanhtien').each(function () {
                        var thanhtien = dj(this).text();
                        tt.push(thanhtien)
                    });


                    // tien cot chiet khau thay doi
                    dj('#chietkhau').change(function () {
                        var ck = parseFloat(dj('#chietkhau').val());
                        var tongtienhang = parseFloat(dj('#tongtien').text());
                        if (ck <= 100) {
                            var tienck = (ck * tongtienhang) / 100;
                            var tienthanhtoan = tongtienhang - tienck;
                            dj('#tienthanhtoan').val(tienthanhtoan);
                            dj('#khachthanhtoan').val(tienthanhtoan);
                            dj('#chietkhau').val(tienck);
                        } else {
                            var tienck = ck;
                            var tienthanhtoan = tongtienhang - tienck;
                            dj('#tienthanhtoan').val(tienthanhtoan);
                            dj('#khachthanhtoan').val(tienthanhtoan);
                        }
                    });
                    
                    // khach thanh toan
                    dj('#khachthanhtoan').change(function () {
                        var psco = parseFloat(dj('#khachthanhtoan').val());

                        var tongtienhang = parseFloat(dj('#tienthanhtoan').val());
                        var tienthoi = psco - tongtienhang;
                        if (tienthoi < 0) {
                            dj('#lblconlai').text("Tiền thiếu :");
                            dj('#conlai').val(tienthoi);
                        } else {
                            dj('#lblconlai').text("Tiền thừa :");
                            dj('#conlai').val(tienthoi);
                        }
                    });
                    var mauin = 0;
                    // in hoa don

                    dj('.inmaunho').click(function () {
                        var tenkh = dj('#tenkh').text();
                        var mahd = dj('#sohd').text();
                        var thoigiankhachra = dj('#giora').text();
                        var thoigianvao = dj('#giovao').text();
                        var tenphong = dj('.hdtenphong').text();
                        var tienphong = dj('#tienthuephong').text();
                        var tongtien = dj('#tongtien').text();
                        var tongthoigianthue = dj('#thoigianthue').text();
                        var giaphongid = dj('#giaphongid').text();
                        var tongtienhang = dj('#tienhang2').val();
                        var tiencoc = dj('.tiencoc').text();
                        var checkin = dj(this).is(':checked');
                        
                        if (checkin == true) {
                            mauin = 1;
                            return dhotel.inhoadon(tenkh, mahd, thoigiankhachra, tienphong, thoigianvao, tenphong,
                                tongthoigianthue, giaphongid, mahang, soluong, dongia, tt, tongtien, tongtienhang, tiencoc, mauin);
                        }
                    });

                    dj('.inkhongcanhoi').click(function () {
                        var tenkh = dj('#tenkh').text();
                        var mahd = dj('#sohd').text();
                        var thoigiankhachra = dj('#giora').text();
                        var thoigianvao = dj('#giovao').text();
                        var tenphong = dj('.hdtenphong').text();
                        var tienphong = dj('#tienthuephong').text();
                        var tongtien = dj('#tongtien').text();
                        var tongthoigianthue = dj('#thoigianthue').text();
                        var giaphongid = dj('#giaphongid').text();
                        var tongtienhang = dj('#tienhang2').val();
                        var tiencoc = dj('.tiencoc').text();
                        var checkin = dj(this).is(':checked');
                        if (checkin == true) {
                            mauin = 0;
                            return dhotel.inhoadon(tenkh, mahd, thoigiankhachra, tienphong, thoigianvao, tenphong,
                                tongthoigianthue, giaphongid, mahang, soluong, dongia, tt, tongtien, tongtienhang, tiencoc, mauin);
                        }

                    });
                }
            }, {
                btnOK: {
                    cls: 'L3',
                    title: 'Cập nhật',
                    command: function () {
                        // thanh toan tien
                        var tenkhachhang = dj('#tenkh').text();
                        var mahd = dj('#sohd').text();
                        var thoigiankhachra = ngaygiora3;
                        var tienphong = dj('#tienthuephong').text();
                        var thoigianthue = dj('#thoigianthue').text();
                        var tongtien = dj('#tongtien').text();
                        var psco = dj('#khachthanhtoan').val();
                        var psno = dj('#conlai').val();
                        var tienck = dj('#chietkhau').val();
                        var tiensauchietkhau = dj('#tienthanhtoan').val();
                        var hh = djson.encode(item['items']);
                        var data = {
                            'tenkhachhang': tenkhachhang,
                            'mahd': mahd,
                            'thoigianra': thoigiankhachra,
                            'tenphong': tenphong,
                            'tienphong': tienphong,
                            'thoigianthue': thoigianthue,
                            'tongtien': tongtien,
                            'psco': psco,
                            'psno': psno,
                            'tienck': tienck,
                            'tiensauchietkhau': tiensauchietkhau,
                            'items': hh
                        };
                        dj.postJSON('/modules/hotel/thanhtoantien', data, function (rs) {
                            if (rs.err === 0) {
                                dWin.alert('Bạn trả phòng thành công!');
                                // doi trang thai thue phong
                                $("#myList UL LI").each(function () {
                                    var nameroom = dj(this).find('#tenphong').text();
                                    if (nameroom == tenphong){
                                        //dj(this).attr('style', 'background-color:gold;');
                                        $(this).find("img").attr('src','/static/images/chuadonphong.jpg');
                                    }
                                })
                            }
                        });
                        return true;
                    }
                },
                btnCancel: {cls: 'L4', title: 'Bỏ qua'}
            })
        },
thongtinphong: function (action, el, tenphong, loaiphongcu) {
            var templates = '<div>' +
                '<table id="dtraphong">' +
                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Loại phòng cũ:</b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<label style="width: 200px;" id="tenphong" name="tenphong">' + loaiphongcu + '</label></td></tr>' +
                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Chọn loại phòng mới: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<select name="loaiphongmoi" id = "loaiphongmoi" class="form-control input-sm" rel=""></select></td>' +
                '</td></tr>' +
                '</table>' +
                '</div>';
            dDialog.openContent(djTemplate.render(templates), 'Thông tin phòng' + tenphong + '', {
                modal: false,
                unloadOnHide: true,
                afterShow: function () {
                    dj.getJSON('/modules/hotel/getloaiphong', function (rs) {
                        if (rs.err === 0) {
                            dj('#loaiphongmoi').dCbo(rs.data);
                        }
                    });
                }
            }, {
                btnOK: {
                    cls: 'L3',
                    title: 'Cập nhật',
                    command: function () {
                        var phongmoiid = dj('#loaiphongmoi').val();
                        var tenloaiphongmoi = "";
                        if (phongmoiid == 1){
                            tenloaiphongmoi = "Đơn";
                        }else if (phongmoiid == 2){
                            tenloaiphongmoi = "Đơn";
                        } else if (phongmoiid == 3){
                            tenloaiphongmoi = "Vip đơn";
                        } else if (phongmoiid == 4){
                            tenloaiphongmoi = "Vip đôi";
                        } else if (phongmoiid == 5){
                            tenloaiphongmoi = "Cao cấp";
                        } else {
                            tenloaiphongmoi = "Tập thể";
                        }
                        dj.getJSON('/modules/hotel/xulyloaiphongmoi', {
                            'phongmoiid': phongmoiid,
                            'tenphong': tenphong
                        }, function (rs) {
                            if (rs.err === 0) {
                                dWin.alert('Bạn chuyển đổi loại phòng thành công!');
                                // doi lai loai phong
                                $("#myList UL LI").each(function () {
                                    var nameroom = dj(this).find('#tenphong').text();
                                    if (nameroom == tenphong){
                                        dj(this).find("label[name='loaiphong']").text(tenloaiphongmoi);
                                    }
                                })
                            }
                        });
                        return true;
                    }
                },
                btnCancel: {cls: 'L4', title: 'Bỏ qua'}
            })
        },
        dichvu: function (action, el, tenphong, data, trangthai) {
            var templates = '<div style="height: 300px;overflow-y:scroll;">' +
                '<table id="dthuephong">' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Thêm dịch vụ: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +

                '<datalist id="json-datalist" class="hanghoa" name="hanghoa form-control input-sm" style="width: 150px; float: left" ></datalist>' +
                '<input type="text" id="ajax" list="json-datalist" placeholder="Chọn tên hàng " style="float: left; width: 150px;" ' +
                'class="form-control input-sm menu_ajax" value="" />' +


                '<span class="themhanghoa"><i class="fa fa-plus-circle" style="font-size:25px; float: left; padding-left:10px;"></i></span>' +
                '</td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px; padding-left:20px;"><b>Số lượng: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><input id="soluong" name="soluong" class="form-control input-sm" value="" /></td>' +
                '</td></tr>' +
                '</table>' +
                '<div style="padding-bottom: 20px;">' +
                '<span class="menu_addproduct" style="padding-right: 30px; padding-left:450px; cursor: pointer;">' +
                '<i class="fa fa-plus-square" style="font-size:25px"></i>&nbsp;Thêm</span>' +
                '<span class="menu_delproduct" style="padding-right: 30px; cursor: pointer;">' +
                '<i class="fa fa-times" style="font-size:25px"></i>Xóa</span>' +
                '</div>' +

                '<table id="menu_tbnhaphang" class="display table table-bordered dataTable no-footer">' +
                '<tr>' +
                '<td>Tên hàng</td><td>Số lượng</td><td>Đơn giá</td><td>Thành tiền</td><td>Del</td>' +
                '</tr>{trs}</table>' +

                '<div><b style="float: left; padding-right: 10px; padding-top: 15px;">Tổng tiền hàng :</b>' +
                '<input style="margin-top:15px; width: 140px; float: left" id="menu_tongtienhang" disabled="disabled" name="tienhang" ' +
                'type="text" class="form-control input-sm" value=""/></div>' +

                '</div>';

            // bat thong tin hang neu da nhap
            if (data == "") {
                var item = {'mahang': '', 'soluong': ''};
                var trs = [];
                var newrow = djTemplate.render('<tr>' +
                    '<td id="tenhang">{mahang}</td>' +
                    '<td id="soluong">{soluong}</td>' +
                    '<td id="giale"></td>' +
                    '<td id="thanhtien"></td>' +
                    '<td><input name="checkinput" class="menu_checkinput" type="checkbox" value="" /></td>' +
                    '</tr>', data);
                trs.push(djTemplate.render(newrow), item);
                item['trs'] = trs.join('');
            }
            // djLog(data['tienhang']);
            // djLog(data);
            if (data['tienhang'] > 0) {
                var item = data;
                item['items'] = djson.decode(data['items']);
                //djLog(item['items']); //{ cafeden=1,  cafenau=1}
                var trs = [];
                for (var i in item['items']) {
                    var soluong = item['items'][i];
                    var hanghoa = 1;
                    var mahang = i;
                    for (var k in item['giaban']) {
                        if (mahang == k) {
                            var giaban = item['giaban'][k];
                            var thanhtien = soluong * giaban;
                        }
                    }
                    data = {
                        'mahang': mahang,
                        'soluong': soluong,
                        'giaban': giaban,
                        'thanhtien': thanhtien
                    };
                    var newrow = djTemplate.render('<tr>' +
                        '<td id="tenhang">{mahang}</td>' +
                        '<td id="soluong">{soluong}</td>' +
                        '<td id="giale">{giaban}</td>' +
                        '<td id="thanhtien">{thanhtien}</td>' +
                        '<td><input name="checkinput" class="menu_checkinput" type="checkbox" value="" /></td>' +
                        '</tr>', data);
                    trs.push(djTemplate.render(newrow));
                }
                item['trs'] = trs.join('');
            }
            //--- *** so luong mat hang gia chua cap nhat duoc //
            dDialog.openContent(djTemplate.render(templates, item), 'Thêm dịch vụ phòng ' + tenphong + '', {
                modal: false,
                unloadOnHide: true,
                afterShow: function () {
                    // nut them moi hang hoa
                    dj('.themhanghoa').click(function () {
                        item = dhanghoa.themhanghoa();
                        // djLog(window.idhanghoa)

                    });
                    dj.getJSON('/modules/hotel/getdichvu', function (rs) {
                        if (rs.err === 0) {
                            dj('.hanghoa').dCbo(rs.data);
                        }
                    });

                    var itemdata = {};
                    var tong = 0;

                    if (trangthai == "edit") {
                        itemdata = item['items'];
                        tong = parseInt(item['tienhang']);
                        dj('#menu_tongtienhang').val(tong);
                    }
                    //nut them san pham
                    dj('.menu_addproduct').click(function () {
                        var mahang = dj('.menu_ajax').val();
                        var soluong = dj('#soluong').val();
                        dj.getJSON('/modules/hotel/getprice', {'mahang': mahang}, function (rs) {
                            if (rs.err === 0) {
                                var giaban = parseInt(rs.data);
                                var thanhtien = parseInt(soluong) * parseInt(giaban);
                                var item = {
                                    'mahang': mahang,
                                    'soluong': soluong,
                                    'giaban': giaban,
                                    'thanhtien': thanhtien
                                };
                                var newrow = djTemplate.render('<tr>' +
                                    '<td id="tenhang">{mahang}</td>' +
                                    '<td id="soluong">{soluong}</td>' +
                                    '<td id="giale">{giaban}</td>' +
                                    '<td id="thanhtien">{thanhtien}</td>' +
                                    '<td><input name="checkinput" class="menu_checkinput" type="checkbox" value="" /></td>' +
                                    '</tr>', item);
                                dj('#menu_tbnhaphang').append(newrow);
                                // phai cap nhat luon phan list menu o tren
                                dj('#tbnhaphang').append(newrow);
                                itemdata[item['mahang']] = parseInt(item['soluong']);
                                tong += thanhtien;
                                dj('#menu_tongtienhang').val(tong);
                                // phai cap nhat luon tong tien o phan thong bao
                                dj('#tongtienhang').val(tong);

                            }
                        });
                    });
                    // nut xoa san pham
                    dj('.menu_delproduct').click(function () {
                        dj('.menu_checkinput').each(function () {
                            var chk = dj(this).is(':checked');
                            if (chk == true) {
                                var delid = dj(this).parent().parent().find('td').eq(0).text();
                                var price = dj(this).parent().parent().find('td').eq(3).text();
                                dj(this).parent().parent().remove();
                                delete itemdata[delid];
                                tong = tong - price;
                                // khi xoa phai xoa luon trong list menu o trong ro hang (phia tren)
                                dj('.checkinput').each(function () {
                                    var new_delid = dj(this).parent().parent().find('td').eq(0).text();
                                    if(new_delid == delid){
                                        dj(this).parent().parent().remove();
                                    }
                                });
                                // ket thuc doan xoa mat hang trong menu phia tren
                                dj('#menu_tongtienhang').val(tong);
                                // phai cap nhat luon tong tien o phan thong bao
                                dj('#tongtienhang').val(tong);
                            }
                        })
                    });
                    window.itemdata = itemdata;
                }
            }, {
                btnOK: {
                    cls: 'L3',
                    title: 'Cập nhật',
                    command: function () {
                        var tienhang = dj('#menu_tongtienhang').val();
                        var data = {
                            'tenphong': tenphong,
                            'tienhang': tienhang,
                            'items': djson.encode(window.itemdata)
                        };
                        dj.getJSON('/modules/hotel/capnhathanghoa', data, function (rs) {
                            if (rs.err === 0) {
                                dWin.alert('Hàng hóa đã được thêm thành công!');
                            }
                        });
                        return true;
                    }
                },
                btnCancel: {cls: 'L4', title: 'Bỏ qua'}
            })
        },
        chuyenphong: function (action, el, tenphong, sohoadon, ngaygiovao, giaphong, hinhthucnghi, tenkh, tiencoc) {
            var templates = '<div>' +
                '<table id="dtraphong">' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Phòng cũ:</b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<label style="width: 200px;" id="phongcu" name="phongcu">' + tenphong + '</label></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Phòng mới: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<select name="phongmoi" id = "phongmoi" class="form-control input-sm" rel=""></select></td>' +
                '</td></tr>' +

                '</table>' +
                '</div>';
            dDialog.openContent(djTemplate.render(templates), 'Chuyển phòng.', {
                modal: false,
                unloadOnHide: true,
                afterShow: function () {
                    dj.getJSON('/modules/hotel/getphongmoi', function (rs) {
                        if (rs.err === 0) {
                            dj('#phongmoi').dCbo(rs.data);
                        }
                    });
                }
            }, {
                btnOK: {
                    cls: 'L3',
                    title: 'Chuyển phòng',
                    command: function () {
                        //doi trang thai phong, lay thong tin phong cu, phong moi lay gia moi
                        var tenphongmoi = dj('#phongmoi').val();
                        var data = {
                            'tenphongcu': tenphong,
                            'tenphongmoi': tenphongmoi,
                            'mahd': sohoadon,
                            'hinhthucnghi': hinhthucnghi
                        };
                        dj.getJSON('/modules/hotel/xulychuyenphong', data, function (rs) {
                            if (rs.err === 0) {
                                dWin.alert('Bạn chuyển phòng thành công !');
                                $("#myList UL LI").each(function () {
                                    var phongcu = dj(this).find('#tenphong').text();
                                    if (phongcu == tenphong) {
                                        $(this).find("img").attr('src','/static/images/phongtrong.jpg');
                                    }
                                    if (phongcu == tenphongmoi){
                                        $(this).find("img").attr('src','/static/images/cokhach.jpg');
                                    }
                                })
                            }
                        });

                        return true;
                    }
                },
                btnCancel: {cls: 'L4', title: 'Bỏ qua'}
            })
        },
        nhaphang: function () {
            var templates = '<div>' +
                '<table id="dnhaphang">' +

                '<tr><td style="padding-bottom: 10px; padding-right: 10px;"><b>Nhập hàng hóa vào trong kho </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<datalist id="json-datalist" class="hanghoa" name="hanghoa form-control input-sm" style="width: 150px; float: left" ></datalist>' +
                '<input type="text" id="phieunhaphang" list="json-datalist" placeholder="Chọn tên hàng " style="float: left; width: 150px;" ' +
                'class="form-control input-sm" value="" />' +
                '</td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;"><b>Số lượng: </b></td>' +
                '<td style="padding-bottom: 10px; padding-right: 10px;">' +
                '<input id="soluongnhaphang" name="soluongnhaphang" class="form-control input-sm" value="" /></td>' +
                '</td></tr>' +
                '</table>' +
                '<div style="padding-bottom: 20px;">' +
                '<span class="addphieunhap" style="padding-right: 30px; padding-left:450px;">' +
                '<i class="fa fa-plus-square" style="font-size:25px"></i>&nbsp;Thêm</span>' +
                '<span class="delnhaphang" style="padding-right: 30px;">' +
                '<i class="fa fa-times" style="font-size:25px"></i>Xóa</span>' +
                '</div>' +
                '<div style="height: 300px; overflow-y: scroll">'+
                '<table id="tbphieunhap" class="display table table-bordered dataTable no-footer">' +
                '<tr>' +
                '<td>Tên hàng</td><td>Số lượng</td><td>Đơn giá</td><td>Thành tiền</td><td>Del</td>' +
                '</tr>{trs}</table>' +
                '</div>'+
                '<div><span style="float: left; padding-right: 10px; padding-top: 20px;"><b style="float: left">Tổng tiền hàng :</b>' +
                '<input style="width: 140px; float: left" id="tongtiennhap" disabled="disabled" name="tongtiennhap" ' +
                'type="text" class="form-control input-sm" value=""/></span></div>' +
                '</div>';
            dDialog.openContent(djTemplate.render(templates), 'Nhập hàng hóa vào kho hàng ' , {
                modal: false,
                unloadOnHide: true,
                afterShow: function () {
                    dj.getJSON('/modules/hotel/getdichvu', function (rs) {
                        if (rs.err === 0) {
                            dj('.hanghoa').dCbo(rs.data);
                        }
                    });
                    var itemdata = {};
                    var tong = 0;
                    dj('.addphieunhap').click(function () {
                        var mahang = dj('#phieunhaphang').val();
                        var soluong = dj('#soluongnhaphang').val();
                        dj.getJSON('/modules/hotel/getinputprice', {'mahang': mahang}, function (rs) {
                            if (rs.err === 0) {
                                var giaban = parseInt(rs.data);
                                var thanhtien = parseInt(soluong) * parseInt(giaban);
                                var item = {
                                    'mahang': mahang,
                                    'soluong': soluong,
                                    'giaban': giaban,
                                    'thanhtien': thanhtien
                                };
                                var newrow = djTemplate.render('<tr>' +
                                    '<td id="tenhang">{mahang}</td>' +
                                    '<td id="soluong">{soluong}</td>' +
                                    '<td id="giale">{giaban}</td>' +
                                    '<td id="thanhtien">{thanhtien}</td>' +
                                    '<td><input name="checknhaphang" class="checknhaphang" type="checkbox" value="" /></td>' +
                                    '</tr>', item);
                                dj('#tbphieunhap').append(newrow);
                                itemdata[item['mahang']] = parseInt(item['soluong']);
                                tong += thanhtien;
                                dj('#tongtiennhap').val(tong);
                            }
                        });
                    });
                    // nut xoa san pham
                    dj('.delnhaphang').click(function () {
                        dj('.checknhaphang').each(function () {
                            var chk = dj(this).is(':checked');
                            if (chk == true) {
                                var delid = dj(this).parent().parent().find('td').eq(0).text();
                                var price = dj(this).parent().parent().find('td').eq(3).text();
                                dj(this).parent().parent().remove();
                                delete itemdata[delid];
                                tong = tong - price;
                                dj('#tongtiennhap').val(tong);
                            }
                        })
                    });
                    window.itemdata = itemdata;
                }
            }, {
                btnOK: {
                    cls: 'L3',
                    title: 'Cập nhật',
                    command: function () {
                        var tienhang = dj('#tongtiennhap').val();
                        var data = {
                            'tienhang': tienhang,
                            'items': djson.encode(window.itemdata)
                        };
                        dj.getJSON('/modules/hotel/phieunhaphang', data, function (rs) {
                            if (rs.err === 0) {
                                dWin.alert('Hàng hóa đã được thêm thành công!');
                            }
                        });
                        return true;
                    }
                },
                btnCancel: {cls: 'L4', title: 'Bỏ qua'}
            })
        }
    };
    var dataList = document.getElementById('json-datalist');
    var input = document.getElementById('ajax');
    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if (request.readyState === 4) {
            if (request.status === 200) {
                var jsonOptions = JSON.parse(request.responseText);
                jsonOptions.forEach(function (item) {
                    var option = document.createElement('option');
                    option.value = item;
                    dataList.appendChild(option);
                    nhanvien.appendChild(option);
                    //tenkhachhang.appendChild(option)

                });
                input.placeholder = "chon tu";
            } else {
                input.placeholder = "Couldn't load datalist options :(";
            }
        }
    };
    input.placeholder = "Loading options...";
    request.open('GET', 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/4621/html-elements.json', true);
    request.send();
}();

if (jQuery)(function () {
    $.extend($.fn, {

        contextMenu: function (o, callback) {
            // Defaults
            if (o.menu == undefined) return false;
            if (o.inSpeed == undefined) o.inSpeed = 150;
            if (o.outSpeed == undefined) o.outSpeed = 75;
            // 0 needs to be -1 for expected results (no fade)
            if (o.inSpeed == 0) o.inSpeed = -1;
            if (o.outSpeed == 0) o.outSpeed = -1;
            // Loop each context menu == lap menu
            $(this).each(function () {
                var el = $(this);
                var offset = $(el).offset();
                // Add contextMenu class
                $('#' + o.menu).addClass('contextMenu');
                // Simulate a true right click
                $(this).mousedown(function (e) {
                    var evt = e;
                    evt.stopPropagation();
                    $(this).mouseup(function (e) {
                        e.stopPropagation();
                        var srcElement = $(this);
                        $(this).unbind('mouseup');
                        if (evt.button == 2) {
                            // Hide context menus that may be showing
                            $(".contextMenu").hide();
                            // Get this context menu
                            var menu = $('#' + o.menu);

                            if ($(el).hasClass('disabled')) return false;

                            // Detect mouse position
                            var d = {}, x, y;
                            if (self.innerHeight) {
                                d.pageYOffset = self.pageYOffset;
                                d.pageXOffset = self.pageXOffset;
                                d.innerHeight = self.innerHeight;
                                d.innerWidth = self.innerWidth;
                            } else if (document.documentElement &&
                                document.documentElement.clientHeight) {
                                d.pageYOffset = document.documentElement.scrollTop;
                                d.pageXOffset = document.documentElement.scrollLeft;
                                d.innerHeight = document.documentElement.clientHeight;
                                d.innerWidth = document.documentElement.clientWidth;
                            } else if (document.body) {
                                d.pageYOffset = document.body.scrollTop;
                                d.pageXOffset = document.body.scrollLeft;
                                d.innerHeight = document.body.clientHeight;
                                d.innerWidth = document.body.clientWidth;
                            }
                            (e.pageX) ? x = e.pageX : x = e.clientX + d.scrollLeft;
                            (e.pageY) ? y = e.pageY : y = e.clientY + d.scrollTop;

                            // Show the menu when right click
                            $(document).unbind('click');
                            $(menu).css({top: y - 100, left: x - 230}).fadeIn(o.inSpeed);
                            // Hover events
                            $(menu).find('A').mouseover(function () {
                                $(menu).find('LI.hover').removeClass('hover');
                                $(this).parent().addClass('hover');
                            }).mouseout(function () {
                                $(menu).find('LI.hover').removeClass('hover');
                            });

                            // Keyboard
                            $(document).keypress(function (e) {
                                switch (e.keyCode) {
                                    case 38: // up
                                        if ($(menu).find('LI.hover').size() == 0) {
                                            $(menu).find('LI:last').addClass('hover');
                                        } else {
                                            $(menu).find('LI.hover').removeClass('hover').prevAll('LI:not(.disabled)').eq(0).addClass('hover');
                                            if ($(menu).find('LI.hover').size() == 0) $(menu).find('LI:last').addClass('hover');
                                        }
                                        break;
                                    case 40: // down
                                        if ($(menu).find('LI.hover').size() == 0) {
                                            $(menu).find('LI:first').addClass('hover');
                                        } else {
                                            $(menu).find('LI.hover').removeClass('hover').nextAll('LI:not(.disabled)').eq(0).addClass('hover');
                                            if ($(menu).find('LI.hover').size() == 0) $(menu).find('LI:first').addClass('hover');
                                        }
                                        break;
                                    case 13: // enter
                                        $(menu).find('LI.hover A').trigger('click');
                                        break;
                                    case 27: // esc
                                        $(document).trigger('click');
                                        break
                                }
                            });

                            // When items are selected
                            $('#' + o.menu).find('A').unbind('click');
                            $('#' + o.menu).find('LI:not(.disabled) A').click(function () {
                                $(document).unbind('click').unbind('keypress');
                                $(".contextMenu").hide();
                                // Callback
                                if (callback) callback($(this).attr('href').substr(1), $(srcElement), {
                                    x: x - offset.left,
                                    y: y - offset.top,
                                    docX: x,
                                    docY: y
                                });
                                return false;
                            });

                            // Hide bindings
                            setTimeout(function () { // Delay for Mozilla
                                $(document).click(function () {
                                    $(document).unbind('click').unbind('keypress');
                                    $(menu).fadeOut(o.outSpeed);
                                    return false;
                                });
                            }, 0);
                        }
                    });
                });

                // Disable text selection
                if ($.browser.mozilla) {
                    $('#' + o.menu).each(function () {
                        $(this).css({'MozUserSelect': 'none'});
                    });
                } else if ($.browser.msie) {
                    $('#' + o.menu).each(function () {
                        $(this).bind('selectstart.disableTextSelect', function () {
                            return false;
                        });
                    });
                } else {
                    $('#' + o.menu).each(function () {
                        $(this).bind('mousedown.disableTextSelect', function () {
                            return false;
                        });
                    });
                }
                // Disable browser context menu (requires both selectors to work in IE/Safari + FF/Chrome)
                $(el).add($('UL.contextMenu')).bind('contextmenu', function () {
                    return false;
                });

            });
            return $(this);
        },

        // Disable context menu items on the fly
        disableContextMenuItems: function (o) {
            if (o == undefined) {
                // Disable all
                $(this).find('LI').addClass('disabled');
                return ( $(this) );
            }
            $(this).each(function () {
                if (o != undefined) {
                    var d = o.split(',');
                    for (var i = 0; i < d.length; i++) {
                        $(this).find('A[href="' + d[i] + '"]').parent().addClass('disabled');

                    }
                }
            });
            return ( $(this) );
        },

        // Enable context menu items on the fly
        enableContextMenuItems: function (o) {
            if (o == undefined) {
                // Enable all
                $(this).find('LI.disabled').removeClass('disabled');
                return ( $(this) );
            }
            $(this).each(function () {
                if (o != undefined) {
                    var d = o.split(',');
                    for (var i = 0; i < d.length; i++) {
                        $(this).find('A[href="' + d[i] + '"]').parent().removeClass('disabled');

                    }
                }
            });
            return ( $(this) );
        },

        // Disable context menu(s)
        disableContextMenu: function () {
            $(this).each(function () {
                $(this).addClass('disabled');
            });
            return ( $(this) );
        },

        // Enable context menu(s)
        enableContextMenu: function () {
            $(this).each(function () {
                $(this).removeClass('disabled');
            });
            return ( $(this) );
        },

        // Destroy context menu(s)
        destroyContextMenu: function () {
            // Destroy specified context menus
            $(this).each(function () {
                // Disable action
                $(this).unbind('mousedown').unbind('mouseup');
            });
            return ( $(this) );
        }

    });
})(jQuery);

