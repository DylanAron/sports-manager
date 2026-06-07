<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>体育管理框架</h2>
        <p>
          夜色如墨，球场却沸腾如昼。十万双眼睛紧锁那片22米的禁区，空气在呐喊中震颤，草屑随疾风飞扬。
          
          第87分钟，7号如猎豹突袭中场，一记贴地直塞撕裂防线，皮球穿过三道蓝色身影，精准坠向那道熟悉的红黑背影——19号凌空抽射！
          门将腾空如鹰，指尖与球皮擦出火星，立柱的嗡鸣声炸响看台，叹息与欢呼在0.01秒间决出胜负。
          
          角旗区在沸腾，汗水晶莹的脊背上叠满队友的掌印。记分牌定格2-1，补时牌却像被命运撕碎的纸片，对手的最后一次冲锋如潮水拍岸，门将跪地抱球的瞬间，终场哨刺破云霄。
          
          此刻，草皮上散落的不仅是战靴的划痕：
          有老将跪地时扬起的、混着泪水的泥土；
          有少年替补席上攥紧的、未拆封的绷带；
          更有看台角落那件传承了三代人的、褪色围巾在夜风中狂舞。
          
          足球从不只是圆的轨迹，它是心跳的具象，是凡人触碰神迹的90分钟。
        </p>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>
      </el-col>
    
    </el-row>
  </div>
</template>

<script setup name="Index">
const version = ref('3.8.9')

function goTarget(url) {
  window.open(url, '__blank')
}
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

