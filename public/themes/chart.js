function preserved() {
    // 柱状图名称集合
    var mychart = [];
    // 饼状图data
    var data = [];
    // 饼状图normal
    var datanormal = {};
    // 饼状图itemStyle
    var dataitemStyle = {};
    // 柱状图名称集合
    var mycharta = [];
    // 柱状图人数集合
    var myChartaNum = [];
    // 柱状图颜色集合
    var myChartaColor = [];
    // 折线图月份集合
    var month = ['月份'];
    // 折线图种类人数
    var typePeonum = [];
    // 折线图单独种类
    var typeOnone = [];
    // 折线图series
    var series = [];
    // 折线图series
    var url = $('#url').val();
    var seriesChildren = { type: 'line', smooth: true, seriesLayoutBy: 'row' };
    cstmpost('', url, '', function (res) {
        console.log(res)
        $('.customerStatus').html('')
        // console.log(res);
        // 客户状态信息
        $.each(res.cstmNum, function (c) {
            var stateahatml = '<div class="col-md-2 customerkind"><div class="panel" style="background:' +
                res.cstmNum[c].color + '"><div class="panel-body"><p>' + res.cstmNum[c].name +
                '</p><div class="label-content"><div class="col-md-3 padding-left-0"><img src="' +
                res.cstmNum[c].pic + '"></div><div class="col-md-9 padding-left-0 padding-right-0"><p class="text-center"><span>' +
                res.cstmNum[c].num + '</span> 个</p></div></div></div></div></div>'

            $('.customerStatus').append(stateahatml)
        })

        // 饼状图参数
        $.each(res.con, function (b) {
            mychart.push(res.con[b].name)
            var datanormal = {
                color: res.con[b].color,
            }
            var dataitemStyle = {
                normal: datanormal,
            }
            var dataline = {
                value: res.con[b].num,
                name: res.con[b].name,
                itemStyle: dataitemStyle
            }
            data.push(dataline);
        })

        // 柱状图参数
        $.each(res.invalid, function (i) {
            myChartaNum.push(res.invalid[i].num)
            mycharta.push(res.invalid[i].name)
            myChartaColor.push(res.invalid[i].color)
        })

        // 折线图月份
        $.each(res.cstmTrend, function (e) {
            month.push(res.cstmTrend[e].name)
        })
        typePeonum.push(month)

        // 折线图种类人数(仅一月)
        $.each(res.cstmTrend[0].cstmTrend, function (e) {
            typeOnone = []
            typeOnone.push(res.cstmTrend[0].cstmTrend[e].name);
            typeOnone.push(res.cstmTrend[0].cstmTrend[e].num);
            typePeonum.push(typeOnone);
            series.push(seriesChildren);
        })

        // 折线图剩下月份人数
        for (var n = 0; n < res.cstmTrend.length - 1; n++) {
            var replace = res.cstmTrend[n + 1].cstmTrend
            for (var m = 0; m < typePeonum.length - 1; m++) {
                typePeonum[m + 1].push(replace[m].num);
            }
        }

        //饼状图
        var myChart = echarts.init(document.getElementById('doug'), '');
        option = {
            backgroundColor: '#fff',
            tooltip: {
                trigger: 'item',
                formatter: "{b} <br/> {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'right',
                y: 'bottom',
                data: mychart
            },
            series: [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius: ['50%', '70%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '12',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data: data
                }
            ]
        };
        myChart.setOption(option);

        // 柱状图
        var myCharta = echarts.init(document.getElementById('douga'), '');
        var colors = myChartaColor;
        var i = 0;
        option = {
            tooltip: {
                trigger: 'axis'
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                top: '10%',
                containLabel: true,
            },
            xAxis: [
                {
                    type: 'category',
                    data: mycharta,
                    splitLine: {
                        show: false
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#000'
                        }
                    },
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    splitLine: {
                        show: false
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#000'
                        }
                    },
                    splitArea: {
                        show: true,
                    },
                }
            ],
            series: [
                {
                    barWidth: '50px',
                    type: 'bar',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: function (d) {
                                i = i + 1;
                                return colors[i - 1];
                            }
                        }
                    },
                    data: myChartaNum,
                }
            ]

        };
        myCharta.setOption(option);

        // 折线图
        var basic = echarts.init(document.getElementById('basic'), '');
        option = {
            backgroundColor: '#fff',
            legend: {},
            tooltip: {
                trigger: 'axis',
                showContent: true
            },
            dataset: {
                source: typePeonum
            },
            xAxis: [
                {
                    type: 'category',
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#000'
                        }
                    },
                }
            ],
            yAxis: {
                gridIndex: 0,
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: '#000'
                    }
                },
            },
            series: series
        };
        basic.setOption(option);
    });
};

