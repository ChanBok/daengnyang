package command;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class MemberCommandDTO {
	String memId;
	String memPw;
	String memPwCon;
	String memName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date memBirth;
	String memGender;
	String memPhone;
	String postNum;
	String memAdd;
	String addDetail;
	String memIntro;
	String memPetCk;
	String petDn;
	String petKind;
	String petName;
	String petAge;
	String petGender;
	String petIntro;
	MultipartFile[] memImage;
	MultipartFile[] petImage;
	
	public MultipartFile[] getPetImage() {
		return petImage;
	}
	public void setPetImage(MultipartFile[] petImage) {
		this.petImage = petImage;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemPwCon() {
		return memPwCon;
	}
	public void setMemPwCon(String memPwCon) {
		this.memPwCon = memPwCon;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public Date getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(Date memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getPostNum() {
		return postNum;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public String getMemAdd() {
		return memAdd;
	}
	public void setMemAdd(String memAdd) {
		this.memAdd = memAdd;
	}
	public String getAddDetail() {
		return addDetail;
	}
	public void setAddDetail(String addDetail) {
		this.addDetail = addDetail;
	}
	public String getMemIntro() {
		return memIntro;
	}
	public void setMemIntro(String memIntro) {
		this.memIntro = memIntro;
	}
	public String getMemPetCk() {
		return memPetCk;
	}
	public void setMemPetCk(String memPetCk) {
		this.memPetCk = memPetCk;
	}
	public String getPetDn() {
		return petDn;
	}
	public void setPetDn(String petDn) {
		this.petDn = petDn;
	}
	public String getPetKind() {
		return petKind;
	}
	public void setPetKind(String petKind) {
		this.petKind = petKind;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getPetAge() {
		return petAge;
	}
	public void setPetAge(String petAge) {
		this.petAge = petAge;
	}
	public String getPetGender() {
		return petGender;
	}
	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}
	public String getPetIntro() {
		return petIntro;
	}
	public void setPetIntro(String petIntro) {
		this.petIntro = petIntro;
	}
	public MultipartFile[] getMemImage() {
		return memImage;
	}
	public void setMemImage(MultipartFile[] memImage) {
		this.memImage = memImage;
	}
	
}
