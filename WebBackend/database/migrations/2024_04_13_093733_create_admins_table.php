<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('admins', function (Blueprint $table) {
            $table->mediumInteger('admin_id')->unsigned()->unique();
            $table->primary('admin_id')->autoIncrement();
            $table->string('admin_name');
            $table->string('admin_email')->unique();
            $table->string('admin_password');
            $table->integer('status')->unsigned()->default(1);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('admins');
    }
};
