import CompanyCard from "@/Components/companyCard";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Head } from "@inertiajs/react";
import axios from "axios";
import { useEffect, useState } from "react";
import { AiOutlineLoading } from "react-icons/ai";
import { FaBuildingCircleCheck } from "react-icons/fa6";

export default function Display({ auth, image_logo }) {
    const [companies, setCompanies] = useState([]);

    useEffect(() => {
        axios.get('http://127.0.0.1:8000/api/companies')
            .then(res => setCompanies(res.data));
    }, []);

    return (
        <Authenticated
            user={auth.user}
            image_logo={image_logo}
            header={
                <h2 className="font-semibold text-xl text-gray-800 leading-tight">
                    Companies
                </h2>
            }
        >
            <Head title="Companies" />
            <div className="w-full min-h-[calc(100vh-138px)]">
                {companies.length == 0 ? (
                    <div className="w-full h-[calc(100vh-138px)] flex items-center justify-center">
                        <AiOutlineLoading className="animate-spin text-[48px]"/>
                    </div>
                ) : (
                    <div className="px-8 py-4">
                        <div className="p-6 w-full h-[80px] green-linear rounded-md shadow-sm flex justify-center flex-col ">
                            <p className="text-2xl font-semibold text-white">
                                Các công ty hợp tác
                            </p>
                            <div className="flex gap-2 items-center text-green-900">
                                <FaBuildingCircleCheck />
                                <p className="mt-[2px]">
                                    {`${companies.length} công ty`}
                                </p> 
                            </div>
                        </div>
                        <div className="mt-4 w-full flex justify-around">
                            <div className="w-[60%] h-[480px] overflow-y-scroll scrollbar-dark">
                                {companies?.map((company, index) => (
                                    <CompanyCard key={index} company={company} />
                                ))}
                            </div>
                            <div className="w-[30%] h-[300px] border border-green-500 rounded-md bg-white p-6 shadow-md">
                                <h1 className="font-bold text-lg">Các công ty gần đây</h1>
                                <div className="mt-6">
                                    <div className="flex gap-4 w-full mt-2 h-[60px] bg-white rounded-md shadow-md hover:border-green-500 border p-2">
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
                                    <div className="flex gap-4 w-full mt-2 h-[60px] bg-white rounded-md shadow-md hover:border-green-500 border p-2">
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
                                    <div className="flex gap-4 w-full mt-2 h-[60px] bg-white rounded-md shadow-md hover:border-green-500 border p-2">
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
                    </div>
                )}
            </div>
        </Authenticated>
    )
}