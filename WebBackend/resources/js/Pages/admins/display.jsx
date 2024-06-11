import AdminCard from "@/Components/adminCard";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Head } from "@inertiajs/react";
import { useEffect, useState } from "react";
import { AiOutlineLoading } from "react-icons/ai";
import { RiAdminFill } from "react-icons/ri";

export default function Display ({ auth, image_logo }) {
    const [admins, setAdmins] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:8000/api/admins')
            .then(res => setAdmins(res.data));
    }, [])

    return (
        <Authenticated
            user={auth.user}
            image_logo={image_logo}
            header={
                <h2 className="font-semibold text-xl text-gray-800 leading-tight">
                    Admins
                </h2>
            }
        >
            <Head title="Admins" />
            <div className="w-full min-h-[calc(100vh-138px)]">
                {admins.length == 0 ? (
                    <div className="w-full h-[calc(100vh-138px)] flex items-center justify-center">
                        <AiOutlineLoading className="animate-spin text-[48px]"/>
                    </div>
                ) : (
                    <div className="px-8 py-4">
                        <div className="p-6 w-full h-[80px] green-linear rounded-md shadow-sm flex justify-center flex-col ">
                            <p className="text-2xl font-semibold text-white">
                                Danh sách các admin 
                            </p>
                            <div className="flex gap-2 items-center text-green-900">
                                <RiAdminFill />
                                <p className="mt-[2px]">
                                    {`${admins.length} Admin`}
                                </p> 
                            </div>
                        </div>
                        <div className="mt-8 grid grid-cols-3 gap-4">
                            {admins.map((admin, index) => (
                                <AdminCard key={index} admin={admin} />
                            ))}
                        </div>
                    </div>
                )}
            </div>
        </Authenticated>
    )
}