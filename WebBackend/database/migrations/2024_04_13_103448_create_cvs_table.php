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
        Schema::create('cvs', function (Blueprint $table) {
            $table->bigIncrements('cv_id');
            $table->mediumInteger('candidate_id');
            $table->foreign('candidate_id')->references('candidate_id')->on('users');
            $table->string('cv_intro');
            $table->text('cv_skill');
            $table->text('cv_hobby');
            $table->text('cv_univer');
            $table->text('project');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cvs');
    }
};
