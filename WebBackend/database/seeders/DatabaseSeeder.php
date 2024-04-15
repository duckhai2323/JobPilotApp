<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        //User::factory(1)->create();

        User::factory()->create([
           'candidate_id' => fake()->unique()->randomNumber(),
            'candidate_name' => fake()->name(),
            'candidate_email' => fake()->unique()->safeEmail(),
            'candidate_password' => '$2y$12$vFz3C9W69hJnHDDSJXt9TObXQh/f65P47s6NyJfyfA48EZ6.6b0ei',
            'remember_token' => Str::random(10),
            'status' => 1,
          
        ]);
    }
}
