import JobfairCard from "@/Components/jobfairCard";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Head } from "@inertiajs/react";
import { useEffect, useState } from "react";
import { AiOutlineLoading } from "react-icons/ai";
import { MdOutlineWork } from "react-icons/md";

export default function Display ({ auth, image_logo }) {
    const [jobfairs, setJobfairs] = useState([]);

    useEffect(() => {
        axios.get('http://127.0.0.1:8000/api/jobs2')
            .then(res => setJobfairs(res.data));
    },[])

    return (
        <Authenticated
            user={auth.user}
            image_logo={image_logo}
            header={
                <h2 className="font-semibold text-xl text-gray-800 leading-tight">
                    Jobfairs
                </h2>
            }
        >
            <Head title="Jobfairs" />
            <div className="w-full min-h-[calc(100vh-138px)]">
                {jobfairs.length == 0 ? (
                    <div className="w-full h-[calc(100vh-138px)] flex items-center justify-center">
                        <AiOutlineLoading className="animate-spin text-[48px]"/>
                    </div>
                ) : (
                    <div className="px-8 py-4">
                        <div className="p-6 w-full h-[80px] green-linear rounded-md shadow-sm flex justify-center flex-col ">
                            <p className="text-2xl font-semibold text-white">
                                Các Jobfair hiện tại
                            </p>
                            <div className="flex gap-2 items-center text-green-900">
                                <MdOutlineWork />
                                <p className="mt-[2px]">
                                    {`${jobfairs.length} Jobfair`}
                                </p> 
                            </div>
                        </div>
                        <div className="mt-8 grid grid-cols-2 gap-4">
                            {jobfairs.map((jobfair, index) => (
                                <JobfairCard key={index} jobfair={jobfair} />
                            ))}
                        </div>
                    </div>
                )}
            </div>
        </Authenticated>
    )
}