<template>
	<!-- 添加锦鲤扫盘-->
	<el-dialog v-model="props.isOpen" :title="props.title" min-width="620" align-center
		@close="emit('update',{reload: false})" class="koifish-pay">
		<div class="match-body">
			<el-form-item label="收款码" required label-width="78">
				<el-upload class="file-uploader" action="#" :http-request="doFileUpload" :show-file-list="false">
					<img v-if="form.payCode" :src="BASE_API+form.payCode" class="pay-code" />
					<el-icon v-else class="file-uploader-icon">
						<Plus />
					</el-icon>
				</el-upload>
			</el-form-item>
		</div>
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
	import { nextTick, onMounted, reactive, ref } from 'vue';
	import { Plus, Minus, Delete } from '@element-plus/icons-vue'
	import UploadProps from 'element-plus'
	import { ElMessage } from 'element-plus'
	import { format, isToday } from 'date-fns';
	import { add as addMatch, update as updatekoiFish, getPayCode, editGroup } from "@/api/business/koiFish";
	import useConvertHitResult from "@/hooks/useConvertHitResult"
	import { uploadImage } from '@/api/common';
	const BASE_API = import.meta.env.VITE_APP_BASE_API;
	const props = defineProps(['isOpen', 'title', 'matchDate'])
	const emit = defineEmits(['update'])
	const form = ref({
		matchDate: props.matchDate,
		payCode: null
	});

	//开始上传图片
	const doFileUpload = (option) => {
		const formData = new FormData();

		formData.append('file', option.file, option.file.name)

		uploadImage(formData).then(resp => {
			console.log("上传成功")
			form.value.payCode = resp.data
		})

	}

	onMounted(()=>{
		doGetPayCode();
	})

	/**
	 * 获取支付码
	 */
	const doGetPayCode = () => {
		getPayCode({matchDate:props.matchDate}).then(resp => {
			if (resp.data != null) {
				form.value = resp.data
			}
		})
	}

	const doSubmit = () => {
		editGroup(form.value).then(resp => {
			ElMessage.success("设置成功!");
		})
	}
</script>
<style lang="scss">
	.el-dialog.koifish-pay {
		margin-top: 0 !important;
		/* 移除默认的margin */
		transform: translateY(-50%);
		/* 向上移动50% */
		top: 50%;
		width: 400px;

		/* 定位到视图的50% */
		.el-dialog__body {
			min-height: 150px;
			overflow: hidden;
		}

	}
</style>
<style lang="scss" scoped>
	.file-uploader {
		width: 178px;
		height: 178px;
		border: 1px red solid;
		display: flex;
		justify-content: center;
		align-items: center;
		border: 1px dashed var(--el-border-color);

		.file-uploader-icon {
			width: 178px;
			height: 178px;
		}

		.pay-code {
			width: 178px;
			height: 178px;
		}
	}
</style>