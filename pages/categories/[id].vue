<template>
    <div>
        <div class="p-4 sm:ml-64">
            <div class="bg-white p-5 rounded-md shadow-sm flex justify-between items-center">
                <h1 class="text-2xl text-black">Edit Categories</h1>
                <NuxtLink to="/categories">
                    <button class="bg-blue-600 shadow-md hover:bg-blue-700 text-white p-2 px-4 rounded-md flex items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left-to-line mr-1"><path d="M3 19V5"/><path d="m13 6-6 6 6 6"/><path d="M7 12h14"/></svg>
                        Back
                    </button>
                </NuxtLink>
            </div>

            
            <div class="bg-white mt-5 shadow-sm p-4 rounded-md">
                <form autocomplete="off" @submit.prevent="submitForm">
                    <div class="mb-5">
                        <label for="categories" class="block mb-2 text-sm font-medium text-gray-900 ">Categories Name</label>
                        <input v-model="formData.name" autocomplete="off" type="text" id="categories" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 " placeholder="Categories" required>
                    </div>
                    <div class="flex justify-end">
                        <button type="submit" class="flex shadow-md text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-4 py-2 text-center ">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pencil"><path d="M17 3a2.85 2.83 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/><path d="m15 5 4 4"/></svg>
                            &nbsp; Save
                        </button>
                    </div>
                </form>

            </div>

        </div>
    </div>
</template>
  
<script setup>
    import Swal from 'sweetalert2';
    const route = useRoute();
    const runtimeConfig = useRuntimeConfig();
    const { id } = useRoute().params;

    const formData = ref({
        name: ''
    })

    $fetch(`${runtimeConfig.public.apiBase}/categories/${id}`).then(res=>{
        
        formData.value.name = res[0].name;
    });


    const submitForm = async () => {
        const data = await $fetch(`${runtimeConfig.public.apiBase}/categories/${id}`, {
            method: 'put',
            body: { 
                name: formData.value.name,
            }
            
        }).then(()=>{
            Swal.fire({
                title: "Update Success fully!",
                text: "You clicked the button!",
                icon: "success"
            });
        })
    }
  
  
</script>