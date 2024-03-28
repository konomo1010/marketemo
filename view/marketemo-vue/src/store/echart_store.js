// 定义共享数据

import {defineStore} from 'pinia'


let date= []
let lbs= []
let bd= []
let sjzt= []
let sjdt= []

const green = '#1FAB5D'
const red = '#C42110'
const blue = '#155DDB'
let echartStore=defineStore({
    id: "options",
    state:()=>{
        // 定义返回的属性值
        return {
            myChart: {},
            startDate: "",
            endDate: "",
            option: {
                legend: {
                    // selected: {
                    //     // '实际跌停数': false  //是否显示折线
                    // }
                },
                width: 1210,
                height: 490,
                color: [blue, red, green],
                title: {text: "MarketEmo"},
                tooltip: {trigger: "axis",axisPointer: {type: 'cross'},formatter: (params)=> { 
                    return date[params[0].dataIndex] + " | " + params[0].value + "板" + "<br>" + bd[params[0].dataIndex] + "absssc"}},
                grid: {left: '3%',right: '4%',bottom: '3%',containLabel: true},
                // 添加 dataZoom 组件，实现鼠标缩放功能
                dataZoom: [
                      {type: 'inside',start: 0,end: 100},
                    //   {show: true,type: 'slider',start: 0,end: 100,handleSize: 8},
                ],
                xAxis: {type: 'category',data: []},
                yAxis: [{dataMin: 1,type: 'value',name:"连板数"},{dataMin: 1,type: 'value',name:"实际涨跌停",max: 1500, min: 0, interval: 300}],
                series: [
                  {
                    name: '连扳数',data: [],type: 'line',smooth: false,
                    label: {show: true,position: 'top',offset: [-6,0],formatter: (params)=>{
                        return bd[params.dataIndex] + " " + params.value + "板"
                    }},
                    yAxisIndex: 0
                  },
                  {
                    name: '实际涨停数',data: [],type: 'line',smooth: false,
                    label: {show: true,position: 'top',offset: [-6,0]},
                    yAxisIndex: 1

                  },
                  {
                    name: '实际跌停数',data: [],type: 'line',smooth: false,
                    label: {show: true,position: 'top',offset: [-6,0]},
                    yAxisIndex: 1
                  },
                ]
            }
        }
    },
    getters: {
        get_option(){
            return this.option
        }
    },
    actions:{ // 定义一些功能性方法
        set_option(datall){
            this.option.xAxis.data = []
            this.option.series[0].data= []
            this.option.series[1].data= []
            this.option.series[2].data= []
            date = []
            lbs = []
            bd = []

            for (var value of datall){
                this.option.xAxis.data.push(value.date)
                this.option.series[0].data.push(value.lbs)
                this.option.series[1].data.push(value.sjzt)
                this.option.series[2].data.push(value.sjdt)
                date.push(value.date)
                lbs.push(value.lbs)
                bd.push(value.bd)
                sjzt.push(value.sjzt)
                sjdt.push(value.sjdt)
            }
        }
    }
})

//导出
export default echartStore