import { MdMarkEmailUnread } from "react-icons/md";
import { FaLink } from "react-icons/fa";
import { FaLocationDot } from "react-icons/fa6";
import { IoToday } from "react-icons/io5";
import { AiFillProfile } from "react-icons/ai";
import { IoPerson } from "react-icons/io5";

export default function CompanyCard({ company }) {
    return (
        <div className="w-[98%] h-[148px] mb-4 p-4 bg-white flex items-center shadow-md hover:border-green-500 border rounded-md">
            <div className="w-[100px] h-[100px]">
                <img 
                    src={company.company_image} 
                    alt="Company Image" 
                    className="w-full h-full"
                />
            </div>
            <div className="ml-6 flex flex-col w-[450px]">
                <div className="w-full whitespace-nowrap overflow-hidden text-ellipsis font-bold text-lg">
                    {company.company_name}
                </div>
                <div className="w-full whitespace-nowrap overflow-hidden text-ellipsis text-gray-500 text-sm">
                    {company.company_intro}
                </div>
                <div className="flex gap-1 text-sm items-center text-gray-400">
                    <MdMarkEmailUnread />
                    <p>{company.email}</p>
                    <a href={company.company_link} target="blank" className="text-[10px] text-gray-500"><FaLink /></a>
                </div>
            </div>
            <div className="ml-8 w-[260px] flex flex-col gap-1 text-gray-500 text-sm">
                <div className="flex items-center gap-2">
                    <FaLocationDot />
                    <div className="w-full whitespace-nowrap overflow-hidden text-ellipsis text-sm">
                        {company.company_location}
                    </div>
                </div>
                <div className="flex items-center gap-2">
                    <IoToday />
                    <p>{company.company_organize}</p>
                </div>
                <div className="flex items-center gap-2">
                    <AiFillProfile />
                    <p>{company.company_filed}</p>
                </div>
                <div className="flex items-center gap-2">
                    <IoPerson />
                    <p>{company.employee_scale.split(' ')[0]}</p>
                </div>
            </div>
        </div>
    )
}