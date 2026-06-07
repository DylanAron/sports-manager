<template>
  <div class="main">
    <div class="search">
      <el-date-picker v-model="queryDate" type="date" placeholder="选择日期" value-format="YYYY-MM-DD" @change="doSearch" />
      <el-button type="primary" :icon="Plus" @click="openAddDialog">添加</el-button>
    </div>
    <div class="body">
      <el-table :data="tableData" style="width: 100%">
        <el-table-column prop="id" label="ID" width="60" />
        <el-table-column prop="leagueName" label="联赛名称" width="120" />
        <el-table-column label="联赛logo" width="80">
          <template #default="scope">
            <el-image v-if="scope.row.leagueLogo" :src="BASE_API + scope.row.leagueLogo" fit="contain" style="width: 50px; height: 50px;" />
          </template>
        </el-table-column>
        <el-table-column prop="homeName" label="主队名称" width="100" />
        <el-table-column label="主队logo" width="80">
          <template #default="scope">
            <el-image v-if="scope.row.homeLogo" :src="BASE_API + scope.row.homeLogo" fit="contain" style="width: 50px; height: 50px;" />
          </template>
        </el-table-column>
        <el-table-column prop="awayName" label="客队名称" width="100" />
        <el-table-column label="客队logo" width="80">
          <template #default="scope">
            <el-image v-if="scope.row.awayLogo" :src="BASE_API + scope.row.awayLogo" fit="contain" style="width: 50px; height: 50px;" />
          </template>
        </el-table-column>
        <el-table-column prop="result" label="赛果" width="80" />
        <el-table-column prop="isTodayData" label="今日数据" width="90">
          <template #default="scope">
            <el-tag v-if="scope.row.isTodayData === 1" type="success">是</el-tag>
            <el-tag v-else type="info">否</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="recommendContent" label="推荐内容" min-width="120" />
        <el-table-column prop="matchDate" label="比赛时间" width="160" />
        <el-table-column prop="isHit" label="是否命中" width="90">
          <template #default="scope">
            <el-tag v-if="scope.row.isHit === -1" type="info">未开奖</el-tag>
            <el-tag v-else-if="scope.row.isHit === 0" type="danger">未命中</el-tag>
            <el-tag v-else-if="scope.row.isHit === 1" type="success">命中</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="创建时间" width="150" />
        <el-table-column fixed="right" label="操作" width="140">
          <template #default="scope">
            <el-button link type="primary" size="small" @click="handleEdit(scope.row)">修改</el-button>
            <el-button link type="danger" size="small" @click="handleDel(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination :page-size="pageReq.pageSize" layout="prev, pager, next" :total="total" @current-change="onPageChange" />
    </div>
    <el-dialog v-model="dialogVisible" :title="dialogType === 'add' ? '添加' : '修改'" width="650px" :close-on-click-modal="false" class="dialog" top="5vh">
      <el-form label-width="100px" v-if="form">
        <el-form-item label="联赛名称" required>
          <el-input v-model="form.leagueName" placeholder="请输入联赛名称" />
        </el-form-item>
        <el-form-item label="联赛logo" required>
          <el-upload class="avatar-uploader" action="#" :http-request="(opts) => doUpload(opts, 'leagueLogo')" :show-file-list="false">
            <img v-if="form.leagueLogo" :src="BASE_API + form.leagueLogo" class="upload-img" />
            <el-icon v-else class="upload-icon"><Plus /></el-icon>
          </el-upload>
        </el-form-item>
        <el-form-item label="主队名称" required>
          <el-input v-model="form.homeName" placeholder="请输入主队名称" />
        </el-form-item>
        <el-form-item label="主队logo" required>
          <el-upload class="avatar-uploader" action="#" :http-request="(opts) => doUpload(opts, 'homeLogo')" :show-file-list="false">
            <img v-if="form.homeLogo" :src="BASE_API + form.homeLogo" class="upload-img" />
            <el-icon v-else class="upload-icon"><Plus /></el-icon>
          </el-upload>
        </el-form-item>
        <el-form-item label="客队名称" required>
          <el-input v-model="form.awayName" placeholder="请输入客队名称" />
        </el-form-item>
        <el-form-item label="客队logo" required>
          <el-upload class="avatar-uploader" action="#" :http-request="(opts) => doUpload(opts, 'awayLogo')" :show-file-list="false">
            <img v-if="form.awayLogo" :src="BASE_API + form.awayLogo" class="upload-img" />
            <el-icon v-else class="upload-icon"><Plus /></el-icon>
          </el-upload>
        </el-form-item>
        <el-form-item label="推荐内容" required>
          <el-input v-model="form.recommendContent" type="textarea" placeholder="请输入推荐内容" />
        </el-form-item>
        <el-form-item label="赛果">
          <el-input v-model="form.result" placeholder="请输入赛果" />
        </el-form-item>
        <el-form-item label="今日数据">
          <el-radio-group v-model="form.isTodayData">
            <el-radio-button :value="1">是</el-radio-button>
            <el-radio-button :value="0">否</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="赛事时间" required>
          <el-date-picker v-model="form.matchDate" type="datetime" placeholder="请选择赛事时间" value-format="YYYY-MM-DD HH:mm:ss" style="width: 100%" />
        </el-form-item>
        <el-form-item label="是否命中">
          <el-radio-group v-model="form.isHit">
            <el-radio-button :value="-1">未开奖</el-radio-button>
            <el-radio-button :value="0">未命中</el-radio-button>
            <el-radio-button :value="1">命中</el-radio-button>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" :loading="saveLoading" @click="doSave">保存</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { onMounted, reactive, ref } from 'vue';
import { Plus } from '@element-plus/icons-vue';
import { selectByPage, uploadImage, add, edit, del } from '@/api/business/goal';
import { ElMessage, ElMessageBox } from 'element-plus';

const BASE_API = import.meta.env.VITE_APP_BASE_API;
const queryDate = ref('');
const tableData = ref([]);
const total = ref(0);
const pageReq = reactive({ pageNum: 1, pageSize: 10 });
const dialogVisible = ref(false);
const dialogType = ref('add');
const form = ref(null);
const saveLoading = ref(false);

onMounted(() => { doGetTableData(); });
function doSearch() { pageReq.pageNum = 1; doGetTableData(); }
function onPageChange(page) { pageReq.pageNum = page; doGetTableData(); }
function doGetTableData() {
  const params = { pageNum: pageReq.pageNum, pageSize: pageReq.pageSize, data: {} };
  if (queryDate.value) params.data.matchDate = queryDate.value;
  selectByPage(params).then(resp => { tableData.value = resp.data.list; total.value = resp.data.total; });
}
function openAddDialog() {
  dialogType.value = 'add';
  form.value = { leagueName: '', leagueLogo: '', homeName: '', homeLogo: '', awayName: '', awayLogo: '', recommendContent: '', result: '', isTodayData: 0, matchDate: '', isHit: -1 };
  dialogVisible.value = true;
}
function handleEdit(row) { dialogType.value = 'edit'; form.value = { ...row }; dialogVisible.value = true; }
function handleDel(row) {
  ElMessageBox.confirm('确定删除该记录吗？', '提示', { type: 'warning' }).then(() => {
    del(row.id).then(() => { ElMessage.success('删除成功'); doGetTableData(); });
  });
}
function doUpload(option, field) {
  const formData = new FormData();
  formData.append('file', option.file);
  uploadImage(formData).then(resp => { form.value[field] = resp.data; });
}
function doSave() {
  if (!form.value.leagueName || !form.value.homeName || !form.value.awayName || !form.value.matchDate || !form.value.recommendContent) {
    ElMessage.warning('请填写所有必填项'); return;
  }
  if (!form.value.leagueLogo || !form.value.homeLogo || !form.value.awayLogo) {
    ElMessage.warning('请上传所有logo图片'); return;
  }
  saveLoading.value = true;
  const action = dialogType.value === 'add' ? add : edit;
  action(form.value).then(() => { ElMessage.success(dialogType.value === 'add' ? '添加成功' : '修改成功'); dialogVisible.value = false; doGetTableData(); }).finally(() => { saveLoading.value = false; });
}
</script>
<style lang="scss" scoped>
.main { padding: 20px; }
.search { display: flex; gap: 12px; margin-bottom: 16px; }
.body { background: #fff; border-radius: 8px; padding: 16px; }
.avatar-uploader { border: 1px dashed var(--el-border-color); border-radius: 6px; cursor: pointer; overflow: hidden; width: 100px; height: 100px; display: flex; align-items: center; justify-content: center; }
.avatar-uploader:hover { border-color: var(--el-color-primary); }
.upload-img { width: 100%; height: 100%; object-fit: contain; }
.upload-icon { font-size: 28px; color: #8c939d; }

:deep(.el-dialog:not(.is-fullscreen)) {
    max-height: 90%;
    margin-top: 6vh !important;
    overflow: auto;
}
</style>
