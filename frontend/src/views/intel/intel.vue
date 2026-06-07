<template>
  <div class="main">
    <div class="top">
      <el-button type="primary" :icon="Edit" :loading="isSaveLoading" @click="doUpdate">保存</el-button>
    </div>

    <div class="body">
      <!-- 日期导航 -->
      <div class="date-nav">
        <el-radio-group v-model="selectedDate">
          <el-radio-button
            v-for="item in dateList"
            :key="item.date"
            :value="item.date"
            :label="item.label"
          />
        </el-radio-group>
      </div>

      <!-- 情报内容 -->
      <div class="content">
        <div class="content-tips tips-text">
          <el-text>情报内容</el-text>
        </div>
        <Editor v-model="contentHtml" :minHeight="300"></Editor>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, reactive, ref, computed, watch } from 'vue';
import { getIntelList, update as updateIntel, add as addIntel } from '@/api/business/intel';
import Editor from '@/components/Editor';
import { Edit } from '@element-plus/icons-vue'
import { ElMessage } from 'element-plus'

const isSaveLoading = ref(false);
const selectedDate = ref('');
const contentHtml = ref('');
const intelMap = reactive({});

// 生成最近7天日期列表
const dateList = computed(() => {
  const list = [];
  const today = new Date();
  for (let i = 0; i < 7; i++) {
    const date = new Date(today);
    date.setDate(today.getDate() - i);
    const dateStr = formatDate(date);
    const label = i === 0 ? '今天' : formatDate(date);
    list.push({ date: dateStr, label });
  }
  return list;
});

function formatDate(date) {
  const y = date.getFullYear();
  const m = String(date.getMonth() + 1).padStart(2, '0');
  const d = String(date.getDate()).padStart(2, '0');
  return `${y}-${m}-${d}`;
}

// 监听 selectedDate 变化，加载对应日期内容
watch(selectedDate, (newDate, oldDate) => {
  if (!newDate) return;
  // 切换日期时先清空编辑器内容
  if (oldDate && newDate !== oldDate) {
    contentHtml.value = '';
  }
  // 从后端获取该日期的数据
  getIntelList(newDate, newDate).then(resp => {
    (resp.data || []).forEach(item => {
      intelMap[item.intelDate] = item;
    });
    if (selectedDate.value === newDate) {
      const updated = intelMap[newDate];
      contentHtml.value = updated ? updated.content || '' : '';
    }
  });
});

onMounted(() => {
  selectedDate.value = dateList.value[0].date;
});

async function doUpdate() {
  if (!contentHtml.value) {
    ElMessage.warning("请输入情报内容");
    return;
  }

  isSaveLoading.value = true;
  try {
    const existing = intelMap[selectedDate.value];
    const params = {
      intelDate: selectedDate.value,
      content: contentHtml.value
    };

    if (existing && existing.id) {
      params.id = existing.id;
      await updateIntel(params);
    } else {
      await addIntel(params);
    }
    ElMessage.success("保存成功");
    // 刷新缓存
    const today = dateList.value[0].date;
    const sevenDaysAgo = dateList.value[dateList.value.length - 1].date;
    getIntelList(sevenDaysAgo, today).then(resp => {
      Object.keys(intelMap).forEach(k => delete intelMap[k]);
      (resp.data || []).forEach(item => {
        intelMap[item.intelDate] = item;
      });
    });
  } finally {
    isSaveLoading.value = false;
  }
}
</script>

<style lang="scss" scoped>
.main {
  position: absolute;
  display: flex;
  flex-direction: column;
  padding: 0px 10px;
  justify-content: flex-start;
  align-items: center;
  height: 100%;
  width: 100%;
  background: #F4F4F4;

  .top {
    width: 100%;
    display: flex;
    justify-content: right;
    padding: 16px 0;

    button {
      margin-right: 60px;
    }
  }

  .body {
    width: 800px;
    border: 1px #F4F4F4 solid;
    border-radius: 8px;
    background: #FFFFFF;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 10px;
    padding: 20px 0;

    .tips-text {
      color: rgb(34, 34, 34);
      font-size: 16px;
      font-weight: 700;
      line-height: 30px;
    }

    .date-nav {
      margin-bottom: 20px;
    }

    .content {
      width: 700px;
    }

    :global(.ql-container) {
      min-height: 300px;
    }
  }
}
</style>
