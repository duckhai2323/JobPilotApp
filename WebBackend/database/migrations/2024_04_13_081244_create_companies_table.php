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
        Schema::create('companies', function (Blueprint $table) {
           $table->bigIncrements('company_id');
           $table->string('company_name')->nullable(false);
           $table->string('email')->nullable(false)->unique();
           $table->string('employee_scale');
           $table->text('company_intro');
           $table->string('company_link');
           $table->string('company_image');
           $table->string('company_location');
           $table->string('company_filed');
           $table->integer('status')->unsigned()->default(1);
           $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('companies');
    }
};
