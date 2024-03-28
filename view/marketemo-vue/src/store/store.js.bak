// 定义共享数据

import {defineStore} from 'pinia'

let chartOptionData=defineStore({
    id: "chartOptionData",
    state:()=>{
        // 定义返回的属性值
        return {
            xdate:"",  // 日期
            sdata:"",  // 连扳数据
            startDate: "",
            endDate: "",
            insertState: false, // 是否插入新增数据成功
        }
    },
    getters: {
        // 定义函数
        get_xdate(){
            return this.xdate
        },
        get_sdata(){
            return this.sdata
        }
    },
    actions:{ // 定义一些功能性方法
        set_xdate(datall){
            this.xdate = []
            for (var value of datall){
                this.xdate.push(value.date)
            }
        },
        set_sdata(datall){
            this.sdata = []
            for (var value of datall){
                this.sdata.push(value.lbs)
            }
        },
        set_insertState(){
            this.insertState = !this.insertState
        }
    }
})

//导出
export default chartOptionData
