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
        Schema::create('jobfairs', function (Blueprint $table) {
            $table->bigIncrements('job_fair_id');
            $table->mediumInteger('candidate_id');
            $table->foreign('candidate_id')->references('candidate_id')->on('candidates');
            $table->bigInteger('job_id')->unsigned();
            $table->foreign('job_id')->references('job_id')->on('jobs');
            $table->bigInteger('company_id')->unsigned();
            $table->foreign('company_id')->references('company_id')->on('companies');
            $table->integer('status')->unsigned()->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('jobfairs');
    }
};
