from django.shortcuts import render
from .models import Job

def job_applicants(request):
    jobs = Job.objects.prefetch_related('applicants__skills').all()
    
    # Calculate totals and prepare job data
    total_applicants = 0
    total_skills = set()
    job_data = []
    
    for job in jobs:
        job_applicants = list(job.applicants.all())
        total_applicants += len(job_applicants)
        
        # Calculate total rows needed for this job (sum of skills for all applicants, with min 1 per applicant)
        total_rows = 0
        for applicant in job_applicants:
            skills = list(applicant.skills.all())
            total_skills.update(skill.name for skill in skills)
            total_rows += max(1, len(skills))
        
        job_data.append({
            'job': job,
            'applicants': job_applicants,
            'total_rows': total_rows,
            'debug': {
                'job_name': job.name,
                'num_applicants': len(job_applicants),
                'calculated_rows': total_rows
            }
        })
    
    # Print debug info to console
    for jd in job_data:
        print(f"Job: {jd['debug']['job_name']}")
        print(f"  Applicants: {jd['debug']['num_applicants']}")
        print(f"  Calculated Rows: {jd['debug']['calculated_rows']}")
        print(f"  Actual Applicants: {len(jd['applicants'])}")
        for i, app in enumerate(jd['applicants'], 1):
            print(f"    Applicant {i}: {app.name} - Skills: {[s.name for s in app.skills.all()]}")
    
    context = {
        'job_data': job_data,
        'total_applicants': total_applicants,
        'total_skills': len(total_skills),
    }
    return render(request, 'job_applicants.html', context)