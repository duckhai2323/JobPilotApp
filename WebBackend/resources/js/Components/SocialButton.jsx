export default function SocialButton({ children, content, styles, ...props }) {
    return (
        <div
            {...props}
            className={
                "w-1/3 h-9 flex flex-row justify-center items-center rounded cursor-pointer" +
                styles
            }
        >
            {children}
            <span className="text-white text-base ml-1">{content}</span>
        </div>
    );
}
