import { MdEmail } from "react-icons/md";

export default function AdminCard ({ admin }) {
    return (
        <div className="h-[150px] shadow-md rounded-md bg-white p-4 flex items-center hover:border-green-500 border">
            <div className="w-[118px] h-[118px]">
                <img 
                    src="/images/avatar-default.svg" 
                    alt="Avatar" 
                    className="w-full h-full"
                />
            </div>
            <div className="ml-8 flex flex-col gap-2">
                <h1 className="text-lg font-bold">{admin.name}</h1>
                <div className="flex items-center text-gray-500 gap-1">
                    <MdEmail />
                    <p>{admin.email}</p>
                </div>
            </div>
        </div>
    )
}