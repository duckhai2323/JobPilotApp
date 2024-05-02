import { useEffect } from "react";
import Checkbox from "@/Components/Checkbox";
import GuestLayout from "@/Layouts/GuestLayout";
import InputError from "@/Components/InputError";
import InputLabel from "@/Components/InputLabel";
import PrimaryButton from "@/Components/PrimaryButton";
import SocialButton from "@/Components/SocialButton";
import TextInput from "@/Components/TextInput";
import { Head, Link, useForm } from "@inertiajs/react";
import { FaGoogle, FaFacebook, FaLinkedin } from "react-icons/fa";

export default function Login({
    status,
    canResetPassword,
    image_logo,
    image_side_login,
}) {
    const { data, setData, post, processing, errors, reset } = useForm({
        email: "",
        password: "",
        remember: false,
    });

    useEffect(() => {
        return () => {
            reset("password");
        };
    }, []);

    const submit = (e) => {
        e.preventDefault();

        post(route("login"));
    };

    return (
        <GuestLayout
            image_logo={image_logo}
            image_side_login={image_side_login}
        >
            <Head title="Log in" />
            {status && (
                <div className="mb-4 font-medium text-sm text-green-600">
                    {status}
                </div>
            )}

            <form onSubmit={submit}>
                <div>
                    <InputLabel htmlFor="email" value="Email" />

                    <TextInput
                        id="email"
                        type="email"
                        name="email"
                        value={data.email}
                        className="mt-1 block w-full"
                        autoComplete="username"
                        isFocused={true}
                        onChange={(e) => setData("email", e.target.value)}
                    />

                    <InputError message={errors.email} className="mt-2" />
                </div>

                <div className="mt-4">
                    <InputLabel htmlFor="password" value="Password" />

                    <TextInput
                        id="password"
                        type="password"
                        name="password"
                        value={data.password}
                        className="mt-1 block w-full"
                        autoComplete="current-password"
                        onChange={(e) => setData("password", e.target.value)}
                    />

                    <InputError message={errors.password} className="mt-2" />
                </div>

                <div className="block mt-4">
                    <label className="flex items-center">
                        <Checkbox
                            name="remember"
                            checked={data.remember}
                            onChange={(e) =>
                                setData("remember", e.target.checked)
                            }
                        />
                        <span className="ms-2 text-sm text-gray-600">
                            Ghi nhớ đăng nhập
                        </span>
                    </label>
                </div>

                <div className="w-full text-center text-gray-600 text-sm mt-5">
                    <span>Hoặc đăng nhập bằng</span>
                </div>

                <div className="w-full flex flex-row justify-between mt-5 gap-5">
                    <SocialButton styles=" bg-[#e73b2f]" content={"Google"}>
                        <FaGoogle color="white" />
                    </SocialButton>
                    <SocialButton styles=" bg-[#1877f2]" content={"Facebook"}>
                        <FaFacebook color="white" />
                    </SocialButton>
                    <SocialButton styles=" bg-[#0a66c2]" content={"LinkeIn"}>
                        <FaLinkedin color="white" />
                    </SocialButton>
                </div>

                {/* <div className="w-full text-center text-gray-600 text-sm mt-5">
                    <span>Bạn chưa có tài khoản?</span>
                    <span className="text-[#00b14f] cursor-pointer">
                        {" "}
                        Đăng ký ngay
                    </span>
                </div> */}

                <div className="flex items-center justify-end mt-4">
                    {canResetPassword && (
                        <Link
                            href={route("password.request")}
                            className="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                        >
                            Quên mật khẩu ?
                        </Link>
                    )}

                    <PrimaryButton className="ms-4" disabled={processing}>
                        Log in
                    </PrimaryButton>
                </div>
            </form>
        </GuestLayout>
    );
}
