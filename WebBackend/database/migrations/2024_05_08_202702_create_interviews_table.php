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
        Schema::create('interviews', function (Blueprint $table) {
            $table->bigIncrements('interview_id');
            $table->bigInteger('job_id')->unsigned();
            $table->foreign('job_id')->references('job_id')->on('job_details');
            $table->string('interview_type');
            $table->integer('index')->unsigned()->default(3);
            $table->string('interview_date');
            $table->integer('status')->unsigned()->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('interviews');
    }
};