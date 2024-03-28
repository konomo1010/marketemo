<script setup>
  import * as echarts from 'echarts';
  import {ref, onMounted, reactive, inject} from 'vue';
  // 导入中文
  import zhCn from 'element-plus/dist/locale/zh-cn.mjs'

  // 导入Store数据
  import echartStore from '../store/echart_store'

  import { ElMessage } from 'element-plus';

  // 定义后端接口
  const gMarketEmoData = '/api/v1/gMarketEmoData'
  const pMarketEmoDataByDateRange = '/api/v1/pMarketEmoDataByDateRange'
  const paddMarketEmoData = '/api/v1/addMarketEmoData'



  // 注入 axios
  let axios = inject("axios")

  let echartstore = reactive(echartStore())

//####################### echart start

  const main = ref()
  
  async function getMarketEmoData(){
      return await axios.get(gMarketEmoData)
  }

  let myChart // 设置chart全局变量

  function setChartOption(){
    getMarketEmoData().then((response)=>{
      echartstore.set_option(response.data)
      myChart.setOption(echartstore.get_option) // 注意： 必须放在then里面，因为异步。
    })
  }

  onMounted(() => {
    myChart = echarts.init(main.value)
    setChartOption()

    myChart.on('circle', (event)=>{
      console.log('==>', event.start, event.end)
  }) 
  })

  // watch(echartstore.get_option, () => {
  //   myChart.setOption(echartstore.get_option)
  // })

//####################### echart ebd

//####################### 按日期过滤 start

  let xvalue = ref('')

  // watch(xvalue,()=>{
  //     echartstore.startDate = xvalue.value[0]
  //     echartstore.endDate = xvalue.value[1]
  // })
  
  async function selectByDate() {
    
    let postData = {
        "startDate": xvalue.value[0],
        "endDate": xvalue.value[1]
    }

    if (xvalue.value[0] == undefined){
        ElMessage({
            showClose: true,
            message: '请选日期',
            type: 'warning',
        })
        return
    }


    return await axios.post(pMarketEmoDataByDateRange,postData)
    .then((response)=>{
        echartstore.set_option(response.data)
        myChart.setOption(echartstore.get_option)
    })
  }

  function disabledDate(time= Date) {
    return time.getTime() > Date.now()
  }


//####################### 按日期过滤 end

//####################### 添加新数据 start
  // 表单
const form = reactive({
  date: '',  // 日期
  lbs: 0, // 连板数
  bd: '', // 标的
  sjzt: 0, // 实际涨停
  sjdt: 0,  // 实际跌停
})
// 提示框显示标识
const dialogVisible = ref(false)

function formCommit() {

  if(form.date == '' || form.date == undefined){
    ElMessage({
            showClose: true,
            message: '请选日期',
            type: 'warning',
    })
  }else {
    form.lbs = parseInt(form.lbs)
    form.sjzt = parseInt(form.sjzt)
    form.sjdt = parseInt(form.sjdt)

    axios.post(paddMarketEmoData, JSON.stringify(form))
    .then((response)=>{
      if(response.data) {
        setChartOption()
        dialogVisible.value = false
      }
    })
  }
  form.date = ''
  form.lbs = 0
  form.bd = ''
  form.sjzt = 0
  form.sjdt = 0
}
//####################### 添加新数据 end

</script>

<template>
  <div>
    <!-- echarts的容器默认宽高是0，如果不设置宽高，页面不显示 -->
    <span class="demonstration">选择月份 : </span>
    <!-- 通过 Config Provider 来配置多语言 -->
    <el-config-provider :locale="zhCn">
        <el-date-picker
            v-model="xvalue"
            type="daterange"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            value-format="YYYY-MM-DD"
            format="YYYY-MM-DD"
            :disabled-date="disabledDate"
            :default-value="[new Date().setMonth(new Date().getMonth() - 1) ,new Date()]"
        />
    </el-config-provider> |
    <el-button type="primary" @click="selectByDate" :plain="true" >确认</el-button>
    <el-button type="primary" @click="dialogVisible = true">添加数据</el-button>

    <el-dialog
        v-model="dialogVisible"
        title="添加新数据"
        width="700"
        :show-close="false"
    >
        <template #footer>
            <div>
                <el-form :model="form" label-width="auto" style="max-width: 600px">
                    <el-form-item label="日期">
                        <!-- <el-input v-model="form.date" /> -->
                        <el-config-provider :locale="zhCn">
                            <el-date-picker
                                v-model="form.date"
                                type="date"
                                value-format="YYYY-MM-DD"
                                format="YYYY-MM-DD"
                                :disabled-date="disabledDate"
                            />
                        </el-config-provider> 
                    </el-form-item>
                    <el-form-item label="当日最高连板数">
                        <el-input v-model="form.lbs" />
                    </el-form-item>
                    <el-form-item label="标的">
                        <el-input v-model="form.bd" />
                    </el-form-item>
                    <el-form-item label="实际涨停">
                        <el-input v-model="form.sjzt" />
                    </el-form-item>
                    <el-form-item label="实际跌停">
                        <el-input v-model="form.sjdt" />
                    </el-form-item>
                </el-form>
                <el-button @click="dialogVisible = false">关闭</el-button>
                <el-button type="primary" @click="formCommit">提交</el-button>
            </div>
        </template>
    </el-dialog>
    <hr>
    <div ref="main" id="divdemo"></div>
  </div>
</template>

<style scoped>
  #divdemo{
    width: 1250px;
    height: 600px;
    border: 1px solid red;
  }
</style>
