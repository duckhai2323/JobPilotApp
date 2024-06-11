import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head } from "@inertiajs/react";
import { FaCalendarCheck } from "react-icons/fa";
import { LineGraph } from "@/Components/lineGraph";
import { PiChartLineFill } from "react-icons/pi";
import { BarGraph } from "@/Components/barChart";
import { IoStatsChartSharp } from "react-icons/io5";

export default function Dashboard({ auth, image_logo }) {
    return (
        <AuthenticatedLayout
            user={auth.user}
            image_logo={image_logo}
            header={
                <h2 className="font-semibold text-xl text-gray-800 leading-tight">
                    Dashboard
                </h2>
            }
        >
            <Head title="Dashboard" />
            <div className="px-8 py-4">
                <div className="p-6 w-full h-[80px] green-linear rounded-md shadow-sm flex justify-center flex-col ">
                    <p className="text-2xl font-semibold text-white">
                        Thị trường làm việc hôm nay
                    </p>
                    <div className="flex gap-2 items-center text-green-900">
                        <FaCalendarCheck />
                        <p className="mt-[2px]">
                            {new Date().toLocaleDateString()}
                        </p> 
                    </div>
                </div>
                <div className="w-full mt-2 flex gap-2">
                    <div className="p-4 w-[25%] h-[70vh] green-linear shadow-sm rounded-md flex flex-col items-center gap-3">
                        <img 
                            src="/images/blog1.png"
                            alt="robot logo" 
                            className="w-full"
                        />
                        <div className="w-full">
                            <p className="text-lg text-white font-semibold">
                                Việc làm mới nhất  
                            </p>
                            <div className="h-[100%] overflow-auto flex flex-col gap-2 mt-2 scrollbar">
                                <div className="flex gap-4 w-[98%] h-[60px] bg-green-400 rounded-md p-2">
                                    <img 
                                        src="/images/sun.png" 
                                        alt="" 
                                        width={60}
                                        height={30}
                                    />
                                    <div className="flex flex-col">
                                        <p className="text-green-900 ">
                                            Cty Sun Asterisk - Sun*
                                        </p>
                                        <p className="text-[10px] text-gray-600">
                                            Hà Nội - Đà Nẵng - TPHCM
                                        </p>
                                    </div>
                                </div>
                                <div className="flex gap-4 w-[98%] h-[60px] bg-green-400 rounded-md p-2">
                                    <img 
                                        src="/images/sun.png" 
                                        alt="" 
                                        width={60}
                                        height={30}
                                    />
                                    <div className="flex flex-col">
                                        <p className="text-green-900 ">
                                            Cty Sun Asterisk - Sun*
                                        </p>
                                        <p className="text-[10px] text-gray-600">
                                            Hà Nội - Đà Nẵng - TPHCM
                                        </p>
                                    </div>
                                </div>
                                <div className="flex gap-4 w-[98%] h-[60px] bg-green-400 rounded-md p-2">
                                    <img 
                                        src="/images/sun.png" 
                                        alt="" 
                                        width={60}
                                        height={30}
                                    />
                                    <div className="flex flex-col">
                                        <p className="text-green-900 ">
                                            Cty Sun Asterisk - Sun*
                                        </p>
                                        <p className="text-[10px] text-gray-600">
                                            Hà Nội - Đà Nẵng - TPHCM
                                        </p>
                                    </div>
                                </div>
                                <div className="flex gap-4 w-[98%] h-[60px] bg-green-400 rounded-md p-2">
                                    <img 
                                        src="/images/sun.png" 
                                        alt="" 
                                        width={60}
                                        height={30}
                                    />
                                    <div className="flex flex-col">
                                        <p className="text-green-900 ">
                                            Cty Sun Asterisk - Sun*
                                        </p>
                                        <p className="text-[10px] text-gray-600">
                                            Hà Nội - Đà Nẵng - TPHCM
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="w-[75%] h-[70vh] green-linear shadow-sm rounded-md p-4">
                        <div className="w-full h-[120px] grid grid-cols-3 gap-3">
                            <div className="dark-green-linear rounded-sm flex flex-col justify-center gap-2 text-green-100 p-5">
                                <p className="text-4xl font-bold">
                                    15
                                </p>
                                <p className="text-sm">Việc làm mới 24h gần nhất</p>
                            </div>
                            <div className="dark-green-linear rounded-sm flex flex-col justify-center gap-2 text-green-100 p-5">
                                <p className="text-4xl font-bold">
                                    10
                                </p>
                                <p className="text-sm">Việc làm đang tuyển</p>
                            </div>
                            <div className="dark-green-linear rounded-sm flex flex-col justify-center gap-2 text-green-100 p-5">
                                <p className="text-4xl font-bold">
                                    5
                                </p>
                                <p className="text-sm">Công ty đang tuyển</p>
                            </div>
                        </div>
                        <div className="mt-3 h-[326px] grid grid-cols-2 gap-3">
                            <div className="dark-green-linear rounded-sm p-4">
                                <div className="flex items-center gap-1 mb-2">
                                    <PiChartLineFill className="text-3xl text-green-400"/>
                                    <p className="text-sm text-white font-semibold">Tăng trưởng cơ hội việc làm</p>
                                </div>
                                <div className="w-full h-[240px] flex justify-center">
                                    <LineGraph />
                                </div>
                            </div>
                            <div className="dark-green-linear rounded-sm p-4">
                                <div className="flex items-center gap-1 mb-2">
                                    <IoStatsChartSharp className="text-2xl text-green-400"/>
                                    <p className="mt-1 text-sm text-white font-semibold">Nhu cầu tuyển dụng theo ngành nghề</p>
                                </div>
                                <div className="w-full h-[200px] flex justify-center">
                                    <div className="w-[90%]">
                                        <BarGraph />
                                    </div>
                                </div>
                                <div className="grid grid-cols-3 grid-flow-row gap-2 mt-2">
                                     <div className="flex items-center gap-2">
                                        <div className="w-[20px] h-[6px] rounded-md bg-[#00f75f]" />
                                        <p className="text-sm text-gray-700">Kinh doanh</p>
                                    </div>
                                    <div className="flex items-center gap-2">
                                        <div className="w-[20px] h-[6px] rounded-md bg-[#3c45bd]" />
                                        <p className="text-sm text-gray-700">Marketing</p>
                                    </div>
                                    <div className="flex items-center gap-2">
                                        <div className="w-[20px] h-[6px] rounded-md bg-[#F76F00]" />
                                        <p className="text-sm text-gray-700">Dịch vụ khách hàng</p>
                                    </div>
                                    <div className="flex items-center gap-2">
                                        <div className="w-[20px] h-[6px] rounded-md bg-[#00F7E9]" />
                                        <p className="text-sm text-gray-700">Tư vấn</p>
                                    </div>
                                    <div className="flex items-center gap-2">
                                        <div className="w-[20px] h-[6px] rounded-md bg-[#F7F100]" />
                                        <p className="text-sm text-gray-700">Hành chính</p>
                                    </div>  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
