import ApplicationLogo from "@/Components/ApplicationLogo";
import { Link } from "@inertiajs/react";

export default function Guest({ children, image_logo, image_side_login }) {
    return (
        <div className="flex flex-row">
            <div className=" flex flex-1 flex-col sm:justify-center items-center pt-6 sm:pt-0 bg-gray-100">
                <div>
                    <Link href="/">
                        <img
                            className="w-50 h-50"
                            src={image_logo}
                            alt="Logo App Image"
                        />
                    </Link>
                </div>

                <div className="mt-6">
                    <span className="text-xl">
                        JobPilot - Ứng dụng kết nối việc làm hàng đầu Việt Nam
                    </span>
                </div>

                <div className="w-full sm:max-w-xl mt-6 px-6 py-4 bg-white shadow-md overflow-hidden sm:rounded-lg">
                    {children}
                </div>
            </div>
            <div className="h-screen w-1/4">
                <img
                    className="object-fill h-screen"
                    src={image_side_login}
                    alt="Image Side Login"
                />
            </div>
        </div>
    );
}
