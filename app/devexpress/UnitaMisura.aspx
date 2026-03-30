<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.master" CodeBehind="UnitaMisura.aspx.vb" Inherits="portaleAgente.UnitaMisura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxLabel ID="titoloLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#990000" Text="Gestione Unità di Misura" Theme="Moderno">
    </dx:ASPxLabel>
    <br />
    <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsUnitaMisura" KeyFieldName="IDUnitaMisura" Width="100%">
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsCommandButton>
                <NewButton>
                    <Image IconID="actions_add_16x16">
                    </Image>
                </NewButton>
                <UpdateButton>
                    <Image IconID="actions_apply_16x16">
                    </Image>
                </UpdateButton>
                <CancelButton>
                    <Image IconID="actions_cancel_16x16">
                    </Image>
                </CancelButton>
                <EditButton>
                    <Image IconID="actions_editname_16x16">
                    </Image>
                </EditButton>
                <DeleteButton>
                    <Image IconID="actions_clear_16x16">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsPopup>
                <EditForm HorizontalAlign="Center" VerticalAlign="Middle" />
            </SettingsPopup>
            <SettingsText PopupEditFormCaption="Unita di Misura" />
            <Columns>
                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="100px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="IDUnitaMisura" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Codice" ShowInCustomizationForm="True" VisibleIndex="3" Width="200px">
                    <PropertiesTextEdit MaxLength="10" Width="300px">
                        <FocusedStyle BackColor="#CCFFFF">
                        </FocusedStyle>
                    </PropertiesTextEdit>
                    <EditFormSettings ColumnSpan="2" RowSpan="1" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descrizione" ShowInCustomizationForm="True" VisibleIndex="2">
                    <PropertiesTextEdit MaxLength="100" Width="800px">
                        <FocusedStyle BackColor="#CCFFFF">
                        </FocusedStyle>
                    </PropertiesTextEdit>
                    <EditFormSettings ColumnSpan="2" RowSpan="1" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IDUtente" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LivelloAutorizzazione" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Ins_DataOra" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Ins_Utente" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Upd_DataOra" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Upd_Utente" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <AlternatingRow BackColor="#F0F0F0">
                </AlternatingRow>
                <SelectedRow BackColor="#FFFF66">
                </SelectedRow>
                <EditForm HorizontalAlign="Center" VerticalAlign="Middle">
                </EditForm>
            </Styles>
            <Border BorderColor="Black" />
    </dx:ASPxGridView>
    <br />
        <asp:SqlDataSource ID="dsUnitaMisura" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:pa_data_userConnectionString %>" DeleteCommand="DELETE FROM [UnitaMisura] WHERE [IDUnitaMisura] = @original_IDUnitaMisura AND (([Codice] = @original_Codice) OR ([Codice] IS NULL AND @original_Codice IS NULL)) AND (([Descrizione] = @original_Descrizione) OR ([Descrizione] IS NULL AND @original_Descrizione IS NULL)) AND (([IDUtente] = @original_IDUtente) OR ([IDUtente] IS NULL AND @original_IDUtente IS NULL)) AND (([LivelloAutorizzazione] = @original_LivelloAutorizzazione) OR ([LivelloAutorizzazione] IS NULL AND @original_LivelloAutorizzazione IS NULL)) AND (([Ins_DataOra] = @original_Ins_DataOra) OR ([Ins_DataOra] IS NULL AND @original_Ins_DataOra IS NULL)) AND (([Ins_Utente] = @original_Ins_Utente) OR ([Ins_Utente] IS NULL AND @original_Ins_Utente IS NULL)) AND (([Upd_DataOra] = @original_Upd_DataOra) OR ([Upd_DataOra] IS NULL AND @original_Upd_DataOra IS NULL)) AND (([Upd_Utente] = @original_Upd_Utente) OR ([Upd_Utente] IS NULL AND @original_Upd_Utente IS NULL))" InsertCommand="INSERT INTO [UnitaMisura] ([Codice], [Descrizione], [IDUtente], [LivelloAutorizzazione], [Ins_DataOra], [Ins_Utente], [Upd_DataOra], [Upd_Utente]) VALUES (@Codice, @Descrizione, @IDUtente, @LivelloAutorizzazione, @Ins_DataOra, @Ins_Utente, @Upd_DataOra, @Upd_Utente)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UnitaMisura] ORDER BY [Descrizione]" UpdateCommand="UPDATE [UnitaMisura] SET [Codice] = @Codice, [Descrizione] = @Descrizione, [IDUtente] = @IDUtente, [LivelloAutorizzazione] = @LivelloAutorizzazione, [Ins_DataOra] = @Ins_DataOra, [Ins_Utente] = @Ins_Utente, [Upd_DataOra] = @Upd_DataOra, [Upd_Utente] = @Upd_Utente WHERE [IDUnitaMisura] = @original_IDUnitaMisura AND (([Codice] = @original_Codice) OR ([Codice] IS NULL AND @original_Codice IS NULL)) AND (([Descrizione] = @original_Descrizione) OR ([Descrizione] IS NULL AND @original_Descrizione IS NULL)) AND (([IDUtente] = @original_IDUtente) OR ([IDUtente] IS NULL AND @original_IDUtente IS NULL)) AND (([LivelloAutorizzazione] = @original_LivelloAutorizzazione) OR ([LivelloAutorizzazione] IS NULL AND @original_LivelloAutorizzazione IS NULL)) AND (([Ins_DataOra] = @original_Ins_DataOra) OR ([Ins_DataOra] IS NULL AND @original_Ins_DataOra IS NULL)) AND (([Ins_Utente] = @original_Ins_Utente) OR ([Ins_Utente] IS NULL AND @original_Ins_Utente IS NULL)) AND (([Upd_DataOra] = @original_Upd_DataOra) OR ([Upd_DataOra] IS NULL AND @original_Upd_DataOra IS NULL)) AND (([Upd_Utente] = @original_Upd_Utente) OR ([Upd_Utente] IS NULL AND @original_Upd_Utente IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_IDUnitaMisura" Type="Int32" />
                <asp:Parameter Name="original_Codice" Type="String" />
                <asp:Parameter Name="original_Descrizione" Type="String" />
                <asp:Parameter Name="original_IDUtente" Type="Int32" />
                <asp:Parameter Name="original_LivelloAutorizzazione" Type="Int32" />
                <asp:Parameter Name="original_Ins_DataOra" Type="DateTime" />
                <asp:Parameter Name="original_Ins_Utente" Type="String" />
                <asp:Parameter Name="original_Upd_DataOra" Type="DateTime" />
                <asp:Parameter Name="original_Upd_Utente" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Codice" Type="String" />
                <asp:Parameter Name="Descrizione" Type="String" />
                <asp:Parameter Name="IDUtente" Type="Int32" />
                <asp:Parameter Name="LivelloAutorizzazione" Type="Int32" />
                <asp:Parameter Name="Ins_DataOra" Type="DateTime" />
                <asp:Parameter Name="Ins_Utente" Type="String" />
                <asp:Parameter Name="Upd_DataOra" Type="DateTime" />
                <asp:Parameter Name="Upd_Utente" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Codice" Type="String" />
                <asp:Parameter Name="Descrizione" Type="String" />
                <asp:Parameter Name="IDUtente" Type="Int32" />
                <asp:Parameter Name="LivelloAutorizzazione" Type="Int32" />
                <asp:Parameter Name="Ins_DataOra" Type="DateTime" />
                <asp:Parameter Name="Ins_Utente" Type="String" />
                <asp:Parameter Name="Upd_DataOra" Type="DateTime" />
                <asp:Parameter Name="Upd_Utente" Type="String" />
                <asp:Parameter Name="original_IDUnitaMisura" Type="Int32" />
                <asp:Parameter Name="original_Codice" Type="String" />
                <asp:Parameter Name="original_Descrizione" Type="String" />
                <asp:Parameter Name="original_IDUtente" Type="Int32" />
                <asp:Parameter Name="original_LivelloAutorizzazione" Type="Int32" />
                <asp:Parameter Name="original_Ins_DataOra" Type="DateTime" />
                <asp:Parameter Name="original_Ins_Utente" Type="String" />
                <asp:Parameter Name="original_Upd_DataOra" Type="DateTime" />
                <asp:Parameter Name="original_Upd_Utente" Type="String" />
            </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    </asp:Content>
