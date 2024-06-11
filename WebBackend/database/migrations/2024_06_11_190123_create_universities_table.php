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
        Schema::create('universities', function (Blueprint $table) {
            $table->bigIncrements('cv_id');
            $table->bigInteger('candidate_id')->unsigned();
            $table->foreign('candidate_id')->references('candidate_id')->on('candidates');
            $table->string('univer_name');
            $table->string('specialized');
            $table->string('start_uni');
            $table->string('end_uni');
            $table->string('description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('universities');
    }
};
