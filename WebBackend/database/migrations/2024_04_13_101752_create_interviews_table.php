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
            $table->mediumInteger('candidate_id');
            $table->foreign('candidate_id')->references('candidate_id')->on('users');
            $table->mediumInteger('agent_id');
            $table->foreign('agent_id')->references('agent_id')->on('agents');
            $table->bigInteger('job_id')->unsigned();
            $table->foreign('job_id')->references('job_id')->on('jobs');
            $table->string('interview_type');
            $table->timestamp('interview_start')->nullable();
            $table->timestamp('interview_end')->nullable();
            $table->integer('status')->unsigned()->default(0);
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
