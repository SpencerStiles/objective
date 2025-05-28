from django.contrib import admin
from .models import Job, Applicants, Skill


class SkillInline(admin.TabularInline):
    model = Skill
    extra = 1

class ApplicantsInline(admin.TabularInline):
    model = Applicants
    extra = 1
    show_change_link = True

@admin.register(Job)
class JobAdmin(admin.ModelAdmin):
    list_display = ('name',)
    inlines = [ApplicantsInline]

@admin.register(Applicants)
class ApplicantsAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'job')
    list_filter = ('job',)
    inlines = [SkillInline]

@admin.register(Skill)
class SkillAdmin(admin.ModelAdmin):
    list_display = ('name', 'applicant')
    list_filter = ('applicant__job',)