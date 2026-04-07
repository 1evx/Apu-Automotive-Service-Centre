<%-- 
    Document   : writeReviewModel
    Created on : 5 Apr 2026, 2:46:16 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="writeReviewModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-4 border-0 shadow">
            <form action="SubmitCommentServlet" method="POST">
                <div class="modal-header border-bottom-0 pb-0">
                    <h5 class="modal-title fw-bold"><i class="fa-solid fa-star text-warning me-2"></i>Rate Your Service</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <input type="hidden" name="appointmentId" id="review-appt-id">

                    <p class="text-muted mb-4">How was your experience with the <strong id="review-appt-title" class="text-dark"></strong> service?</p>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Star Rating</label>
                        <select class="form-select border-warning" name="rating" required>
                            <option value="5" selected>⭐⭐⭐⭐⭐ (5) Excellent</option>
                            <option value="4">⭐⭐⭐⭐ (4) Very Good</option>
                            <option value="3">⭐⭐⭐ (3) Average</option>
                            <option value="2">⭐⭐ (2) Poor</option>
                            <option value="1">⭐ (1) Terrible</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Written Feedback</label>
                        <textarea class="form-control" name="content" rows="4" placeholder="Tell us what you loved, or what we can improve..." required></textarea>
                    </div>
                </div>
                <div class="modal-footer border-top-0 pt-0">
                    <button type="button" class="btn btn-secondary fw-bold px-4" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning fw-bold px-4 text-dark">Submit Review</button>
                </div>
            </form>
        </div>
    </div>
</div>
