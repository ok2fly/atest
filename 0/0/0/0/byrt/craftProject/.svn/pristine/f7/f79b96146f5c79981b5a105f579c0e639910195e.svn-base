; !function (win) {
    var base = {
        cookie: {
            get: function (name) {
                var arg = name + "=";
                var alen = arg.length;
                var clen = document.cookie.length;
                var i = 0;
                while (i < clen) {
                    var j = i + alen;
                    if (document.cookie.substring(i, j) == arg) {
                        var endstr = document.cookie.indexOf(";", j);
                        if (endstr == -1) {
                            endstr = document.cookie.length;
                        }
                        return decodeURIComponent(document.cookie.substring(j, endstr));
                    }
                    i = document.cookie.indexOf(" ", i) + 1;
                    if (i == 0) break;
                }
                return "";
            },
            set: function (name, value, expires, path, domain, secure) {
                document.cookie = name + "=" + encodeURIComponent(value) +
                ((expires) ? "; expires=" + expires : "") +
                ((path) ? "; path=" + path : "") +
                ((domain) ? "; domain=" + domain : "") +
                ((secure) ? "; secure" : "");
            },
            del: function (name, path, domain) {
                if (this.get(name)) {
                    document.cookie = name + "=" +
                            ((path) ? "; path=" + path : "") +
                            ((domain) ? "; domain=" + domain : "") +
                            "; expires=Thu, 01-Jan-70 00:00:01 GMT";
                }
            }
        },
        delay: function (fnFun, nTime) {
            nTime = ((nTime === undefined || nTime < 0) ? 1000 : nTime);
            return setTimeout(function () { fnFun(); }, nTime);
        },
        url: {
            redirect: function (sUrl, oParam) {
                if (!oParam) {
                    location.href = sUrl
                } else {
                    location.href = sUrl + (sUrl.indexOf('?') == -1 ? '?' : '&') + $.param(oParam);
                }
            },
            delayRedirect: function (sUrl, nTime, oParams) {
                return base.delay(function () {
                    base.url.redirect(sUrl, oParams);
                }, nTime)
            }
        },
        layer: {
            alert:function(){

            }
        },
        storage: {
            get: function (key) {
                try {
                    return localStorage.getItem(key);
                } catch (e) {
                    base.layer.info("您可能处于无痕/隐身浏览模式，为保证正常使用，请切换回正常模式");
                    return "";
                }
            },
            set: function (key, val) {
                try {
                    localStorage.setItem(key, val);
                    return true;
                } catch (e) {
                    base.layer.info("您可能处于无痕/隐身浏览模式，为保证正常使用，请切换回正常模式");
                    return false;
                }
            }
            , remove: function (key) {
                try {
                    localStorage.removeItem(key);
                    return true;
                } catch (e) {
                    base.layer.info("您可能处于无痕/隐身浏览模式，为保证正常使用，请切换回正常模式");
                    return false;
                }
            }
        },
        regExp: {
            mobile: /^1[3-9]\d{9}$/,
            email: /^[\w\+\-]+(\.[\w\+\-]+)*@[a-z\d\-]+(\.[a-z\d\-]+)*\.([a-z]{2,4})$/i,
            numlen6: /^\d{6}$/,
            password: /^[\x21-\x7E]{6,50}$/,
            name: /^[\u4e00-\u9fa50-9a-zA-Z \.]{1,20}$/,
            postcode: /^\d{6}$/,
            address: /^[\u4E00-\u9FA50-9a-zA-Z_()（）#-]{1,78}$/,
            remark: /^[\u4E00-\u9FA5 \x21-\x7E]{1,200}$/,
            company: /^[\u4E00-\u9FA50-9a-zA-Z_()（）#-]{1,50}$/,
            couponcode: /^[0-9a-zA-Z]{6,12}$/,
            cardno : /(^\d{15}$)|(^\d{17}([0-9]|X)$)/
        },
        date: {
            format: function (date, fmt) {
                if (typeof fmt === 'undefined') {
                    fmt = date;
                    date = new Date();
                }
                var o = {
                    "M+": date.getMonth() + 1, //月份
                    "d+": date.getDate(), //日
                    "h+": date.getHours(), //小时
                    "m+": date.getMinutes(), //分
                    "s+": date.getSeconds(), //秒
                    "q+": Math.floor((date.getMonth() + 3) / 3), //季度
                    "S": date.getMilliseconds() //毫秒
                };
                if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
                for (var k in o)
                    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                return fmt;
            }
        }
    };
    win.base = base;

    if (typeof define == "function" && define.amd) {
        define("base", ["jquery", "layer"], function () {
            layer.config({
              path: '/js/' //layer.js所在的目录，可以是绝对目录，也可以是相对目录
            });
            (function($, undefined) {
				$.fn.placeholder = function(options) {
					var defaults = {
						labelMode: false,
						labelStyle: {},
						labelAlpha: false,
						labelAcross: false
					};
					var params = $.extend({}, defaults, options || {});
					var funLabelAlpha = function(elementEditable, elementCreateLabel) {
							if (elementEditable.val() === "") {
								elementCreateLabel.css("opacity", 0.4).html(elementEditable.data("placeholder"))
							} else {
								elementCreateLabel.html("")
							}
						},
						funPlaceholder = function(ele) {
							if (document.querySelector) {
								return $(ele).attr("placeholder")
							} else {
								var ret;
								ret = ele.getAttributeNode("placeholder");
								return ret && ret.nodeValue !== "" ? ret.nodeValue : undefined
							}
						};
					$(this).each(function() {
						var element = $(this),
							isPlaceholder = "placeholder" in document.createElement("input"),
							placeholder = funPlaceholder(this);
						if (!placeholder || (!params.labelMode && isPlaceholder) || (params.labelMode && !params.labelAcross && isPlaceholder)) {
							return
						}
						element.data("placeholder", placeholder);
						if (params.labelMode) {
							var idElement = element.attr("id"),
								elementLabel = null;
							if (!idElement) {
								idElement = "placeholder" + Math.random();
								element.attr("id", idElement)
							}
							elementLabel = $('<label for="' + idElement + '"></label>').css($.extend({
								lineHeight: "1.3",
								position: "absolute",
								color: "graytext",
								cursor: "text",
								marginLeft: element.css("marginLeft"),
								marginTop: element.css("marginTop"),
								paddingLeft: element.css("paddingLeft"),
								paddingTop: element.css("paddingTop")
							}, params.labelStyle)).insertBefore(element);
							if (params.labelAlpha) {
								element.bind({
									"focus": function() {
										funLabelAlpha($(this), elementLabel)
									},
									"input": function() {
										funLabelAlpha($(this), elementLabel)
									},
									"blur": function() {
										if (this.value === "") {
											elementLabel.css("opacity", 1).html(placeholder)
										}
									}
								});
								if (!window.screenX) {
									element.get(0).onpropertychange = function(event) {
										event = event || window.event;
										if (event.propertyName == "value") {
											funLabelAlpha(element, elementLabel)
										}
									}
								}
								elementLabel.get(0).oncontextmenu = function() {
									element.trigger("focus");
									return false
								}
							} else {
								element.bind({
									"focus": function() {
										elementLabel.html("")
									},
									"blur": function() {
										if ($(this).val() === "") {
											elementLabel.html(placeholder)
										}
									}
								})
							}
							if (params.labelAcross) {
								element.removeAttr("placeholder")
							}
							if (element.val() === "") {
								elementLabel.html(placeholder)
							}
						} else {
							element.bind({
								"focus": function() {
									if ($(this).val() === placeholder) {
										$(this).val("")
									}
									$(this).css("color", "")
								},
								"blur": function() {
									if ($(this).val() === "") {
										$(this).val(placeholder).css("color", "graytext")
									}
								}
							});
							if (element.val() === "") {
								element.val(placeholder).css("color", "graytext")
							}
						}
					});
					return $(this)
				}
			})($);

            return base;
        });
    }
}(window);