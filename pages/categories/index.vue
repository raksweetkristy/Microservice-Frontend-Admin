<template>
    <div>
        <div class="p-4 sm:ml-64">
            <div class="bg-white p-5 rounded-md shadow-sm flex justify-between items-center">
                <h1 class="text-2xl text-black">Categories</h1>
                <NuxtLink to="/categories/create">
                    <button class="bg-blue-600 hover:bg-blue-700 text-white shadow-md p-2 px-4 rounded-md flex items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus-square mr-1"><rect width="18" height="18" x="3" y="3" rx="2"/><path d="M8 12h8"/><path d="M12 8v8"/></svg>
                        Add
                    </button>
                </NuxtLink>
            </div>

            <div class="relative overflow-x-auto shadow-md sm:rounded-lg mt-5">
                <table class="w-full text-sm text-left rtl:text-right text-gray-500 ">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-50 ">
                        <tr>
                            <th scope="col" class="px-6 py-3">
                                #
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Categories Name
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Options
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(data, index) in items" class="bg-white border-b  hover:bg-gray-50">
                         
                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap ">
                                {{ index+1 }}
                            </th>
                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap ">
                                {{ data.name }}
                            </th>
                            
                            <td class="px-6 py-4">
                                <div class="flex">
                                    <NuxtLink :to="`/categories/${data.id}`">
                                        <UButton
                                        icon="i-heroicons-pencil-square"
                                        size="lg"
                                        color="blue"
                                        square
                                        variant="solid"
                                    />
                                    </NuxtLink>
                                    &nbsp;
                                    <UButton v-on:click="deleteItem(data.id)"
                                        icon="i-heroicons-trash"
                                        size="lg"
                                        color="yellow"
                                        square
                                        variant="solid"
                                    />
                                </div>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>

            
        </div>
    </div>
  </template>
  
  <script setup>
    import Swal from 'sweetalert2';
  
    useHead({
        title: 'Categories',
    });

    const runtimeConfig = useRuntimeConfig();
    const { data: items } = await useAsyncData('items', () => $fetch(`${runtimeConfig.public.apiBase}/categories`));
    

    const deleteItem = async (id=null) => {

        //delete data with API
        await $fetch(`${runtimeConfig.public.apiBase}/categories/${id}`, {
            method: 'DELETE'
        });

        refreshNuxtData('items');
        Swal.fire({
                title: "Good job!",
                text: "You can check in catgories list!",
                icon: "success"
        });
    }

  
</script>