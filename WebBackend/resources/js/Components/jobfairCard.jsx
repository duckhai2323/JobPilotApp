import { FaLocationDot } from "react-icons/fa6";
import { IoToday } from "react-icons/io5";

export default function JobfairCard ({ jobfair }) {
    return (
        <div className="relative h-[200px] p-4 rounded-md shadow-md flex items-center bg-white border hover:border-green-500">
            <div className="w-[150px] h-[150px]">
                <img 
                    src={jobfair.company_image} 
                    alt="Company Image" 
                    className="w-full h-full"
                />
            </div>
            <div className="ml-8 w-[70%]">
                <div className="w-full whitespace-nowrap overflow-hidden text-ellipsis font-bold text-lg">
                    {jobfair.job_title}
                </div>
                <div className="w-full whitespace-nowrap overflow-hidden text-ellipsis text-gray-500 text-sm">
                    {jobfair.company_name}
                </div>
                <div className="mt-2 flex items-center gap-1 text-gray-500 text-sm">
                    <FaLocationDot className="text-[12px]"/>
                    <div className="w-full whitespace-nowrap overflow-hidden text-ellipsis text-sm">
                        {jobfair.job_location}
                    </div>
                </div>
                <div className="mt-2 flex items-center gap-1 text-gray-500 text-sm">
                    <IoToday />
                    <p>{jobfair.deadline_job}</p>
                </div>
                <div className="flex mt-4 gap-2">
                    <div className="h-[26px] text-sm bg-slate-300 text-slate-500 font-bold p-2 flex items-center justify-center rounded-md">
                        <p>{jobfair.salary}</p>
                    </div>
                    <div className="h-[26px] text-sm bg-slate-300 text-slate-500 font-bold p-2 flex items-center justify-center rounded-md">
                        <p>Kinh nghiệm {jobfair.experience_require}</p>
                    </div>
                    <div className="h-[26px] text-sm bg-slate-300 text-slate-500 font-bold p-2 flex items-center justify-center rounded-md">
                        <p>{jobfair.candidate_number} người</p>
                    </div>
                </div>
                <div className={`
                    absolute h-[30px] w-[150px] font-bold text-sm p-2 top-6 right-6 z-50 rounded-md flex items-center justify-center
                    ${jobfair.status == 1 && "bg-green-500 text-white"}
                    ${jobfair.status == 0 && "bg-red-500 text-white"}
                    ${jobfair.status != 1 && jobfair.status != 0 && "bg-yellow-500 text-white"}
                `}>
                    {jobfair.status == 1 && <p>Đang hiển thị</p>}
                    {jobfair.status == 0 && <p>Đã kết thúc</p>}
                    {jobfair.status != 1 && jobfair.status != 0 && <p>Đang phỏng vấn</p>}
                </div>
            </div>
        </div>
    )
}