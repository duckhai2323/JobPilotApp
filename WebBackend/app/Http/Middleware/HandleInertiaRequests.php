<?php

namespace App\Http\Middleware;

use Illuminate\Http\Request;
use Inertia\Middleware;

class HandleInertiaRequests extends Middleware
{
    /**
     * The root template that is loaded on the first page visit.
     *
     * @var string
     */
    protected $rootView = 'app';

    /**
     * Determine the current asset version.
     */
    public function version(Request $request): string|null
    {
        return parent::version($request);
    }

    /**
     * Define the props that are shared by default.
     *
     * @return array<string, mixed>
     */
    public function share(Request $request): array
    {
     
        $image_logo = asset('images/app-logo.png');
        $image_side_login = asset('images/image_side_login.png');
        return [
            ...parent::share($request),
            'auth' => [
                'user' => $request->user(),
            ],
            'image_logo' => $image_logo,
            'image_side_login' => $image_side_login,
        ];
    }
}
