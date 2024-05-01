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
        Schema::create('savejobs', function (Blueprint $table) {
            $table->bigIncrements('save_job_id');
            $table->mediumInteger('candidate_id');
            $table->foreign('candidate_id')->references('candidate_id')->on('candidates');
            $table->bigInteger('job_id')->unsigned();
            $table->foreign('job_id')->references('job_id')->on('jobs');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('savejobs');
    }
};
