<template>
	<div class="main">
		<!-- 方案页面 -->
		<div class="search">
			<div class="expert-name">
				<el-select v-model="data.params.expertId" remote reserve-keyword placeholder="选择专家" size="large"
					style="width: 240px" filterable :remote-method="doGetExpertList" :loading="data.loadingSearch">
					<el-option v-for="item in data.expertList" :key="item.id" :label="item.name" :value="item.id" />
				</el-select>
				<el-input class="search-lg-name" v-model="data.params.leagueName" style="width: 240px"
					placeholder="请输入联赛名称" />
				<el-button type="primary" :icon="Search" :loading="data.searchLoading" @click="doSearch">搜索</el-button>
				<el-button type="primary" :icon="Plus" @click="data.openAddDialog=true">添加</el-button>
				<el-button type="danger" :icon="Delete" @click="doClean">清除</el-button>
			</div>
		</div>
		<div class="body">
			<el-table :data="data.tableData" style="width: 100%">
				<el-table-column prop="id" label="ID" />
				<el-table-column prop="expertId" label="专家id" />
				<el-table-column prop="leagueName" label="联赛名称" />
				<el-table-column prop="homeName" label="主队名称" />
				<el-table-column prop="guestName" label="客队名称" />
				<el-table-column prop="matchTime" label="比赛时间" min-width="140" />
				<el-table-column prop="likeNum" label="喜欢人数" />
				<el-table-column prop="status" label="发布状态">
					<template #default="scope">
						{{scope.row.status==0?'未发布':'已发布'}}
					</template>
				</el-table-column>
				<el-table-column prop="createTime" label="创建时间" />
				<el-table-column fixed="right" label="操作" min-width="120">
					<template #default="scope">
						<el-button v-if="scope.row.status==0" link type="success" size="small" @click="handlePublishClick(scope.row)">
							发布
						</el-button>
						<el-button link type="primary" size="small" @click="handleEditClick(scope.row)">
							修改
						</el-button>
						<el-button link type="danger" size="small" @click="handleDelClick(scope.row)">删除</el-button>
					</template>
				</el-table-column>

			</el-table>
			<el-pagination :page-size="data.pageReq.pageSize" layout="prev, pager, next" :total="data.total" />
		</div>

		<div class="add-div" v-if="data.openAddDialog">
			<SchemeAdd :openAddDialog="data.openAddDialog" :schemeType="data.params.type"
				@update="listenComponentsChange"></SchemeAdd>
		</div>

		<div class="edit-div" v-if="data.openEditDialog">
			<SchemeEdit :openEditDialog="data.openEditDialog" :detail="data.current" @update="listenComponentsChange">
			</SchemeEdit>
		</div>
	</div>
</template>

<script setup>
	import { computed, onMounted, reactive } from 'vue';
	import { Search, Plus, Delete } from '@element-plus/icons-vue'
	import { getTableData, update } from "@/api/business/scheme";
	import { ElMessage } from 'element-plus/es';
	import SchemeAdd from '@/components/scheme/add';
	import SchemeEdit from '@/components/scheme/update';
	import { ElMessageBox } from 'element-plus'
	import { format } from 'date-fns'
	import { getTableData as getExpertList } from '@/api/business/expert'
	const data = reactive({
		searchLoading: false,
		openAddDialog: false,
		openEditDialog: false,
		loadingSearch: false,
		timer: null,
		tableData: [],
		total: 0,
		expertList: [

		],
		params: {
			type: 0,
			expertId: null,
			leagueName: ''
		},
		pageReq: {
			pageNum: 1,
			pageSize: 10
		},
		current: {}
	})

	onMounted(() => {
		doGetTableData();
	})


	//开始搜索
	const doSearch = async () => {
		data.searchLoading = true;
		try {
			await doGetTableData();
		} finally {
			data.timer = setTimeout(() => {
				data.searchLoading = false;
			}, 500)
		}
	}

	const doGetTableData = async () => {
		//获取请求参数
		let pageParams = data.pageReq;
		pageParams.data = data.params;

		await getTableData(pageParams).then(resp => {
			let result = resp.data;
			data.total = result.total;
			data.tableData = result.list;
		})
	}


	const reload = () => {
		data.pageReq.pageNum = 1
		data.params.searchText = "";
		doGetTableData();
	}

	const handlePublishClick = (row) => {
		let params = {
			id: row.id,
			status: 1,
			publishTime: format(new Date(), 'yyyy-MM-dd HH:mm:ss')
		}

		ElMessageBox.confirm('是否确认发布?')
			.then(() => {
				update(params).then(resp => {
					ElMessage.success("发布成功!")
					reload();
				})
			})
			.catch(() => {
				// catch error
			})
	}


	const handleEditClick = (row) => {
		data.current = row;
		data.openEditDialog = true;
	}
	const handleDelClick = (row) => {
		let params = {
			id: row.id,
			status: -1
		}
		ElMessageBox.confirm('是否确认删除?')
			.then(() => {
				update(params).then(resp => {
					ElMessage.success("删除成功!")
					reload();
				})
			})
			.catch(() => {
				// catch error
			})

	}



	// 监听组件变换
	const listenComponentsChange = (params) => {
		switch (params.type) {
			case 0: //添加
				data.openAddDialog = false;
				if (params.reload) {
					reload();
				}
				break;
			case 1: //修改
				data.openEditDialog = false;
				if (params.reload) {
					reload();
				}
				break;
		}
	}

	const doGetExpertList = async (selectText) => {
		data.loadingSearch = true;
		try {
			let pageParams = {
				pageNum: 1,
				pageSize: 10,
				data: {
					searchText: selectText
				}
			}
			await getExpertList(pageParams).then(resp => {
				let result = resp.data;
				data.expertList = result.list;
			})
		} finally {
			data.loadingSearch = false;
		}
	}
	const doClean = () => {
		data.params.expertId = null;
		data.params.leagueName = '';
	}
</script>

<style lang="scss" scoped>
	.main {
		position: absolute;
		height: 100%;
		width: 100%;
		padding: 20px;
		display: flex;
		flex-direction: column;

		.search {
			//height: 3rem;
			display: flex;
			align-items: center;
			padding-bottom: 1rem;
			border-bottom: 1px solid rgba(193, 193, 193, .3);

			:global(.expert-name .el-input) {
				margin-left: 20px;
				height: 40px;
			}

			.expert-name {
				display: flex;
				align-items: center;
			}

			.expert-name>button {
				margin-left: 20px;
			}

		}

		.body {
			height: 0px;
			flex-grow: 1;
			display: flex;
			flex-direction: column;
			align-items: center;

			.el-pagination {
				.el-table__inner-wrapper {
					overflow-x: scroll;
				}
			}
		}
	}
</style>