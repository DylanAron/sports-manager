<template>
	<!-- 添加专家页面 -->
	<el-dialog v-model="data.openAddExpertDialog" title="添加专家" width="500" align-center
		@close="emit('update',{type: 0,reload: false})">
		<el-form :model="form" label-position="right">
			<el-form-item label="专家名称" required>
				<el-input v-model="form.name" autocomplete="off" placeholder="请输入专家名称" />
			</el-form-item>
			<el-form-item label="专家头像" required>
				<el-upload class="avatar-uploader" action="#" :http-request="doAvatarUpload" :show-file-list="false"
					:before-upload="beforeUpload">
					<img v-if="form.avatar" :src="BASE_API+form.avatar" class="avatar" />
					<el-icon v-else class="avatar-uploader-icon">
						<Plus />
					</el-icon>
				</el-upload>
			</el-form-item>
			<el-form-item label="是否启用" required>
				<el-select v-model="form.status" placeholder="是否启用">
					<el-option v-for="(statusItem,index) in data.statusList" :key="statusItem.value" :label="statusItem.label"
						:value="statusItem.value" />
				</el-select>
			</el-form-item>
			<el-form-item label="排序索引" required>
				<el-input v-model="form.sort" autocomplete="off" />
			</el-form-item>
			<el-form-item label="命中描述" required>
				<el-input v-model="form.hitText" autocomplete="off" />
			</el-form-item>
			<el-form-item label="连红次数" required>
				<el-input type="number" v-model="form.continueNum" autocomplete="off" />
			</el-form-item>
		</el-form>

		<template #footer>
			<div class="dialog-footer">
				<el-button @click="emit('update',{type: 0,reload: false})">取消</el-button>
				<el-button type="primary" @click="doSubmit">
					确认
				</el-button>
			</div>
		</template>

	</el-dialog>


</template>

<script setup>
	import { reactive, ref } from 'vue';
	import { Plus } from '@element-plus/icons-vue'
	import UploadProps from 'element-plus'
	import { ElMessage } from 'element-plus'
	import { uploadAvatar, add } from '@/api/business/expert'
	const BASE_API = import.meta.env.VITE_APP_BASE_API;
	const props = defineProps(['openAddExpertDialog'])
	const emit = defineEmits(['update'])
	const data = reactive({
		openAddExpertDialog: props.openAddExpertDialog,
		formLabelWidth: '140px',
		statusList: [{
				value: 0,
				label: '停用',
			},
			{
				value: 1,
				label: '启用',
			},
		]
	})



	let image = reactive("")

	const form = reactive({
		name: '',
		avatar: '',
		hitText: '',
		continueNum: null,
		status: 1
	})



	const beforeUpload = (file) => {
		if (file.type.indexOf("image/") == -1) {
			ElMessage.error("文件格式错误，请上传图片类型,如：JPG，PNG后缀的文件。");
		} else {
			const reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = () => {
				image = reader.result;
			};
		}
	}

	//开始上传头像
	const doAvatarUpload = (option) => {
		const formData = new FormData();

		formData.append('avatarFile', option.file, option.file.name)

		uploadAvatar(formData).then(resp => {
			console.log("上传成功")
			form.avatar = resp.data
		})

	}

	//添加专家
	const doSubmit = () => {
		add(form).then(resp => {
			ElMessage.success("添加成功!");
			emit('update', { type: 0, reload: true })
		})
	}
</script>

<style lang="scss" scoped>
	:global(.el-form-item) {
		align-items: center;
	}

	:global(.el-overlay-dialog) {
		justify-content: center;
		align-items: center;
	}

	:global(.el-dialog.is-align-center) {
		margin: 0 !important;
	}

	:global(.avatar-uploader .avatar) {
		width: 178px;
		height: 178px;
		display: block;
	}

	:global(.avatar-uploader .el-upload) {
		border: 1px dashed var(--el-border-color);
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
		transition: var(--el-transition-duration-fast);
	}

	:global(.avatar-uploader .el-upload:hover) {
		border-color: var(--el-color-primary);
	}

	:global(.el-icon.avatar-uploader-icon) {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		text-align: center;
	}
</style>